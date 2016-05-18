# Homepage (Root path)
helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
end

get '/' do
  erb :login unless current_user
  erb :index
end

get '/signup' do
  erb :'signup'
end

get '/login' do
  erb :'login'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  #TODO: Valuable error message!
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    erb :'index'
  else
    erb :'login'
  end
end

post '/signup' do
  @user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
  )
  if @user.save
    erb :'index'
  else
    erb :'signup'
  end
end

post '/logout' do
  session.clear
  redirect '/'
end

post '/upvote/:id' do
  #TODO: Error message if tried to
  @track = Track.find params[:id]
  upvote = Upvote.new(track_id: @track.id, user_id: current_user.id)
  if upvote.save
    @track.num_votes += 1
  end
  @track.save
  redirect '/tracks'
end

post '/tracks/review/:id' do
  #TODO: Error message if tried to
  @track = Track.find params[:id]
  erb :'tracks/review'
end

post '/review' do
  #TODO: add track_id
  @review = Review.new(content: params[:content], user_id: current_user.id, track_id: params[:track_id], rating: params[:num].to_i)
  if @review.save
    redirect '/tracks'
  else
    #TODO: Output errors if this happens
    @tracks = Track.all.order(num_votes: :desc)
  	erb :'tracks/index'
  end
end

post '/tracks/delete/review/:id' do
  Review.destroy(params[:id])
  redirect '/tracks'
end


get '/tracks' do
  redirect '/login' unless current_user
	@tracks = Track.all.order(num_votes: :desc)
	erb :'tracks/index'
end


get '/tracks/new' do
  redirect '/login' unless current_user
	@track = Track.new
	erb :'tracks/new'
end

get '/tracks/:id' do
  redirect '/login' unless current_user
	@track = Track.find params[:id]
	erb :'tracks/show'
end

# post '/tracks/review/rate/:id/:num' do
#   binding.pry
# end

post '/tracks' do
	@track = Track.new(
	title: params[:title],
  artist: params[:artist],
	url: params[:url],
	author: params[:author],
  user_id: session[:user_id]
	)
	if @track.save
		redirect '/tracks'
	else
		erb :'tracks/new'
	end
end
