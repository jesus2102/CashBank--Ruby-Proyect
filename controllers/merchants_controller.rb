require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant.rb' )
also_reload( '../models/*' )

get '/merchants' do
  @merchants = Merchant.all()
  erb (:"merchants/index")
end

get '/merchants/new' do
  erb (:"merchants/new")
end

post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save
  redirect '/merchants'
end

post '/merchants/:id' do
  @merchant = Merchant.new(params)
  @merchant.update()
  redirect '/merchants'
end

get '/merchants/:id/edit' do
  @merchants = Merchant.all()
  @edit = Merchant.find(params[:id].to_i())
  @id = params[:id].to_i()
  erb (:"merchants/edit")
end

post '/merchants/:id/delete' do
  @merchant = Merchant.find(params[:id].to_i())
  @merchant.delete()
  redirect '/merchants'
end
