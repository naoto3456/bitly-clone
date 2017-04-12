get '/' do
  erb :"static/index"
end

get '/about' do
  erb :"static/about"
end

get '/signup' do
  erb :"static/signup"
end

post '/create_user' do
	print "+++++++++++++++++++++"
	print params
	print "+++++++++++++++++++++"

	user = User.new(name:params[:name], email:params[:email])
	if user.save
		redirect "/users/profile/#{user.id}"
	else
		render 'static/singup'
	end
end

#lsof -i :9393
#kill -(pid) 

get '/users/profile/:id' do
	id = params[:id]
	@user = User.find(id)
	erb :'users/profile'
end

post '/urls' do
	url = Url.new(long_url:params[:long_url])
	#url.shorten

	if url.save
		redirect "/#{url.short_url}"
	else
		render "/"
	end
end

get '/:short_url' do
	puts "++++++++++++++++++++++"
	s_url = params[:short_url]
	url = Url.find_by(short_url: s_url)
	redirect "#{url.long_url}"
	
end