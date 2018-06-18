require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/tags' do
  @tags = Tag.all()
  erb (:"tags/index")
end

get '/tags/new' do
  erb (:"tags/new")
end

post '/tags' do
  @tag = Tag.new(params)
  @tag.save
  redirect '/tags'
end
