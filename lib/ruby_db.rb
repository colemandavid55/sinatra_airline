require 'pg'

class Airline


  def airline_count
    @db = PG.connect(host: 'localhost', dbname: 'airline_data')
    sql = %q[SELECT count(distinct carrier) 
            FROM flights 
          ]
    result = @db.exec(sql).entries

  end

end



#  month | airline_id | carrier | origin_city_name | dest_city_name  | dep_delay_new | arr_delay_new 
# -------+------------+---------+------------------+-----------------+---------------+---------------
#      1 |      19805 | AA      | New York, NY     | Los Angeles, CA |         14.00 |         13.00
#      1 |      19805 | AA      | New York, NY     | Los Angeles, CA |          0.00 |          1.00
