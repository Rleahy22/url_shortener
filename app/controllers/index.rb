get '/' do
  @url = Url.new
  @new_url = params[:url]
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  @url = Url.create(:long_url => params[:long_url], :click_count => 0)
  if @url.id?
    redirect "/?url=#{@url.short_url}"
  else
    erb :index
  end
end

get '/:short' do
  @url = Url.find_by_short_url(params[:short])
  redirect @url.long_url
end
