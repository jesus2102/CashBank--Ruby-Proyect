require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

get '/transactions' do
  @transactions = Transaction.all()
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb (:"transactions/index")
end

get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb (:"transactions/new")
end

post '/transactions' do
  Transaction.new(params).save
  redirect '/transactions'
end

get '/transactions/:id/edit' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  @transactions = Transaction.all()
  @edit = Transaction.find(params[:id].to_i())
  @id = params[:id].to_i()
  erb (:"transactions/edit")
end

post '/transactions/:id/delete' do
  @transaction = Transaction.find(params[:id].to_i())
  @transaction.delete()
redirect '/transactions'
end
