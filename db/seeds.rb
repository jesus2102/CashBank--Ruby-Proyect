require('pry')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()


merchant1 = Merchant.new({
  'name' => 'Amazon'
})
merchant2 = Merchant.new({
  'name' => 'Tesco'
})
merchant3 = Merchant.new({
  'name' => 'Apple'
})
merchant4 = Merchant.new({
  'name' => 'Co-op'
})

merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()


tag1 = Tag.new({
  'name' => 'Groceries'
})
tag2 = Tag.new({
  'name' => 'Toiletries'
})
tag3 = Tag.new({
  'name' => 'Computing'
})
tag4 = Tag.new({
  'name' => 'Office'
})

tag1.save()
tag2.save()
tag3.save()
tag4.save()

transaction1 = Transaction.new({
  'merchant_id' => merchant1.id,
  'tag_id' => tag3.id,
  'amount' => 3995,
  'reference' => 'Hard drive',
  'transaction_date' => '2018/06/13 15:08:02'
})

transaction2 = Transaction.new({
  'merchant_id' => merchant2.id,
  'tag_id' => tag1.id,
  'amount' => 2415,
  'reference' => '',
  'transaction_date' => '2018/06/13'
})

transaction3 = Transaction.new({
  'merchant_id' => merchant1.id,
  'tag_id' => tag4.id,
  'amount' => 11995,
  'reference' => 'New chair',
  'transaction_date' => '2018/08/14'
})

transaction4 = Transaction.new({
  'merchant_id' => merchant4.id,
  'tag_id' => tag1.id,
  'reference' => 'Barbacue',
  'transaction_date' => '2018/06/17'
})

transaction5 = Transaction.new({
  'merchant_id' => merchant3.id,
  'tag_id' => tag3.id,
  'reference' => 'Ipad Pro',
  'transaction_date' => '2018/06/18'
})

transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()
transaction5.save()

binding.pry
nil
