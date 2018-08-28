require( 'sinatra' )
require( 'pry' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/money.rb' )
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
  params['amount'] = Money.in_out(params['type'], params['amount'].to_f())
  params['amount'] =  Money.money_to_db(params['amount'])
  Transaction.new(params).save
  redirect '/transactions'
end

get '/transactions/:id/edit' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  @transactions = Transaction.all()
  @id = params[:id].to_i()
  erb (:"transactions/modify")
end

post '/transactions/:id' do
  params['amount'] = Money.money_to_db(params['amount'])
  transaction = Transaction.new(params)
  transaction.update
  redirect '/transactions'
end

post '/transactions/:id/delete' do
  @transaction = Transaction.find(params[:id].to_i())
  @transaction.delete()
redirect '/transactions'
end
