get '/' do

  @urls = Url.all.order("id DESC")

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
#kill -9 (pid) 

get '/users/profile/:id' do
	id = params[:id]
	@user = User.find(id)
	erb :'users/profile'
end

post '/urls' do
	url = Url.new(long_url:params[:long_url])
	if url.save
		return @current_url = url.to_json
	#	@urls = Url.all
	#	erb :"static/index", layout:false
	else
		status 400
		return  @url.errors.full_messages.first
		# @error = url.errors.full_messages.first
		# puts @error
		# @urls = Url.all
		# erb :"static/index"
	end
end

get '/:short_url' do
	s_url = params[:short_url]
	url = Url.find_by(short_url: s_url)
	url.click_count += 1
	url.save
	puts "++++ current click_count is #{url.click_count}"
	redirect "#{url.long_url}"	
end