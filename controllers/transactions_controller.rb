require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

get '/transactions' do
  @transactions = Transaction.all()
  erb (:"transactions/index")
end

get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb (:"transactions/new")
end

post '/transactions' do
  @transactions = Transaction.new(params)
  @transactions.save
  redirect '/transactions'
end
