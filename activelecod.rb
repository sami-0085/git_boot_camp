Inventory.joins(:film).

Inventory.joins(:film).where(film: { title: "BLANKET BEVERLY" }).size
Film.joins(:inventories).where(film: { title: "BLANKET BEVERLY" }).size

『映画「BLANKET BEVERLY」のDVD、いくつ在庫あるっけ？』
在庫の数が知りたいから
Inventory.joins(:film).where(film: { title: "BLANKET BEVERLY" }).size

Rental.where('return_date > ?', '2005-08-30')
Rental.where('rental_date >= ?', '2005-01-01').where('return_date IS NULL')

Film.select(:film_id, :title).joins(inventories: :rentals)
.where(rental: { rental_date: Time.new(2005).
beginning_of_year..Time.new(2005).end_of_year, return_date: nil })