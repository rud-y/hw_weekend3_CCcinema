require_relative('models/ticket')
require_relative('models/customer')
require_relative('models/film')


require('pry-byebug')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


customer1 = Customer.new({'name' => 'Benjamin','funds' => '20'})
customer1.save()
customer2 = Customer.new({'name' => 'Christine','funds' => '10'})
customer2.save()
customer3 = Customer.new({'name' => 'Henry','funds' => '8'})
customer3.save()
customer4 = Customer.new({'name' => 'Danielle', 'funds' => '14'})
customer4.save()

film1 = Film.new({'title' => 'Braveheart', 'price' => '9'})
film2 = Film.new({'title' => 'Magnificent 7', 'price' => '10'})
film3 = Film.new({'title' => 'Sing', 'price' => '6'})
film4 = Film.new({'title' => 'Inception', 'price' => '7'})
film5 = Film.new({'title' => 'Celebration', 'price' => '9'})
film1.save()
film2.save()
film3.save()
film4.save()
film5.save()

# film1.title = 'LastOfTheMohicans'
# film1.update()


ticket1 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film4.id})
ticket2 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film2.id})
ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket4 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film4.id})
ticket5 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film4.id})
ticket6 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket7 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})
ticket8 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id})
ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()
ticket6.save()
ticket7.save()
ticket8.save()



binding.pry
nil
