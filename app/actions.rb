# Homepage (Root path)
get '/' do
  erb :index
end

get '/posts' do
	@tracks = Track.all
	erb :'posts/index'
end

get '/posts/new' do
	@track = Track.new
	erb :'posts/new'
end

get '/posts/:id' do
	@track = Track.find params[:id]
	erb :'posts/show'
end

post '/posts' do
	@track = Track.new(
	title: params[:title],
  artist: params[:artist],
	url: params[:url],
	author: params[:author]
	)
	if @track.save
		redirect '/posts'
	else
		erb :'posts/new'
	end
end
