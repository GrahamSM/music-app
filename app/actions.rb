# Homepage (Root path)
enable :sessions
helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
end

get '/' do
  redirect '/login' unless current_user
  erb :index
end

get '/signup' do
  erb :'signup'
end

get '/login' do
  erb :'login'
end

get '/posts' do
  redirect '/login' unless current_user
	@tracks = Track.all
  @tracks.each do |track|
    new_url = track.url.sub('watch?v=', 'embed/')
    track.url = new_url
  end
	erb :'posts/index'
end

get '/posts/new' do
  redirect '/login' unless current_user
	@track = Track.new
	erb :'posts/new'
end



get '/posts/:id' do
  redirect '/login' unless current_user
	@track = Track.find params[:id]
	erb :'posts/show'
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

post '/login' do
  @user = User.find_by(username: params[:username])
  # username = params[:username]
  # password = params[:password]
  # password_confirmation = params[:password_confirmation]
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    erb :'index'
  else
    erb :'login'
  end
end

post '/posts' do
	@track = Track.new(
	title: params[:title],
  artist: params[:artist],
	url: params[:url],
	author: params[:author],
  user_id: session[:user_id]
	)
	if @track.save
		redirect '/posts'
	else
		erb :'posts/new'
	end
end
