require ('pg')

class BB

  attr_reader( :first_name, :last_name, :length_of_stay, :bedroom_type, :breakfast, :id, :check_in )

  def initialize( options )
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @bedroom_type = options['bedroom_type']
    @breakfast = options['breakfast']
    @length_of_stay = options['length_of_stay'].to_i
    @check_in = options['check_in']
  end

  def self.all
    db = PG.connect( {dbname: 'bed_breakfast', host: 'localhost'})
    sql = "SELECT * FROM bbs" 
    bookings = db.exec(sql) #therefore need to store array of hashes and map it to pizzas as below
    result = bookings.map { |booking| BB.new(booking)}
    db.close
    return result # then finally return the new array of pizzas

  end

  def save
    db = PG.connect( {dbname: 'bed_breakfast', host: 'localhost'})
    sql = "INSERT INTO bbs (
      first_name,
      last_name,
      bedroom_type,
      breakfast,
      length_of_stay,
      check_in
    ) VALUES ( 
      '#{@first_name}',
      '#{@last_name}',
      '#{@bedroom_type}',
      '#{@breakfast}',
      '#{@length_of_stay}',
      '#{@check_in}'
    ) RETURNING *"
    bb_data = db.exec(sql) # this value saves all the info inputted to us
    db.close
    @id = bb_data.first()['id'].to_i
  end

end