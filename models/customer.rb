require_relative("../db/sql_runner")

class Customer

    attr_accessor :name, :funds
    attr_reader :id

    def initialize (options)
        @id = options['id'].to_i if ['options']
        @name = options['name']
        @funds = options['funds'].to_i
    end


    def save()
        sql = "INSERT INTO customers (name, funds)
        VALUES($1, $2) RETURNING  id"
        values = [@name, @funds]
        customer = SqlRunner.run(sql, values).first
        @id = customer['id'].to_i
    end

    def films()
        sql = "SELECT * FROM films
        INNER JOIN tickets 
        ON films.id = tickets.film_id
        WHERE customer_id = $1"
        values = [@id]
        result = SqlRunner.run(sql, values)
        movies_to_see = result.map{|film| Film.new(film)}
        return movies_to_see
    end
        
   
    def update()
        sql = "UPDATE customers SET (name, funds) = ($1, $2)
        WHERE id = $3"
        values = [@name, @funds, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM customers WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.all()
        sql = "SELECT * FROM customers"
        result = SqlRunner.run(sql)
        customers = result.map{|customer| Customer.new(customer)}
        return customers
    end

    def self.delete_all()
        sql = "DELETE FROM customers"
        SqlRunner.run(sql)
    end
end