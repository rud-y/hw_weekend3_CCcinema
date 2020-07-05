require_relative('../db/sql_runner')

class Ticket

    attr_accessor :customer_id, :film_id
    attr_reader :id

    def initialize (options)
        @id = options['id'].to_i if options['id']
        @customer_id = options['customer_id'].to_i
        @film_id = options['film_id'].to_i
    end


    def save()
        sql = "INSERT INTO tickets (customer_id, film_id)
        VALUES ($1, $2) RETURNING id"
        values = [@customer_id, @film_id]
        ticket = SqlRunner.run(sql, values).first
        @id = ticket['id'].to_i
    end

    def customer()
        sql = "SELECT * FROM customers
        WHERE id = $1"
        values = [@customer_id]
        customer = SqlRunner.run(sql, values).first
        return Customer.new(customer).name
    end

    def film() 
        sql = "SELECT * FROM films
        WHERE id = $1"
        values = [@film_id]
        film = SqlRunner.run(sql, values).first
        return Film.new(film)
    end


    def update()
        sql = "UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3"
        values = [@customer_id, @film_id, @id]
        SqlRunner.run(sql, values)
    end

    def self.all()
        sql = "SELECT * FROM tickets"
        result = SqlRunner.run(sql)
        tickets = result.map{|ticket| Ticket.new(ticket)}
        return tickets
    end

    def self.delete_all()
        sql = "SELECT * FROM tickets"
        SqlRunner.run(sql)
    end



end