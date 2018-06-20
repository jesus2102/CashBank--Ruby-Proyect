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

post '/tags/:id' do
  @tag = Tag.new(params)
  @tag.update()
  redirect '/tags'
end

get '/tags/:id/edit' do
  @tags = Tag.all()
  @edit = Tag.find(params[:id].to_i())
  @id = params[:id].to_i()
  erb (:"tags/modify")
end

post '/tags/:id/delete' do
  @tag = Tag.find(params[:id].to_i())
  @tag.delete()
  redirect '/tags'
end
