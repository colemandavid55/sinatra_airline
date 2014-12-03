require 'pg'

class Airline


  def airline_count
    @db = PG.connect(host: 'localhost', dbname: 'airline_data')
    sql = %q[SELECT count(distinct carrier) 
            FROM flights 
          ]
    result = @db.exec(sql).entries

  end

  def delayed_arrival
    @db = PG.connect(host: 'localhost', dbname: 'airline_data')
    sql = %q[
            SELECT carrier, count(*)
            FROM flights
            WHERE arr_delay_new > 0
            GROUP BY carrier
            ORDER BY count desc
            ]
    result = @db.exec(sql).entries
  end

  def delayed_departure
    @db = PG.connect(host: 'localhost', dbname: 'airline_data')
    sql = %q[
          SELECT origin_city_name, count(*)
          FROM flights
          WHERE dep_delay_new > 0 OR arr_delay_new > 0
          GROUP by origin_city_name
          ORDER BY count desc
          ]
    result = @db.exec(sql).entries
  end

  def arriving_late
    @db = PG.connect(host: 'localhost', dbname: 'airline_data')
    sql = %q[
          SELECT dest_city_name, count(*)
          FROM flights
          WHERE dep_delay_new > 0 OR arr_delay_new > 0
          GROUP by dest_city_name
          ORDER by count desc
          ] 
    result = @db.exec(sql).entries
  end

  def average_late
    @db = PG.connect(host: 'localhost', dbname: 'airline_data')
    sql = %q[
          SELECT avg(dep_delay_new)
          FROM flights
          ]
    result = @db.exec(sql).entries
  end

  def average_airline
    @db = PG.connect(host: 'localhost', dbname: 'airline_data')
    sql = %q[
          SELECT carrier, avg(dep_delay_new)
          FROM flights
          GROUP BY carrier
          ORDER BY avg desc;
          ]
    result = @db.exec(sql).entries
  end

end



#  month | airline_id | carrier | origin_city_name | dest_city_name  | dep_delay_new | arr_delay_new 
# -------+------------+---------+------------------+-----------------+---------------+---------------
#      1 |      19805 | AA      | New York, NY     | Los Angeles, CA |         14.00 |         13.00
#      1 |      19805 | AA      | New York, NY     | Los Angeles, CA |          0.00 |          1.00
