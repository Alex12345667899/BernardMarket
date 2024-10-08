# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
puts "All Bernards were destroyed"

user_attributes = [
  { email: "client@bernard.com", last_name: "client", password: "azerty" },
  { email: "bernard.tapie@coquille.com", last_name: "Tapie", password: "azerty" },
  { email: "bernard.ebianca@disney.com", last_name: "Ebianca", password: "azerty" },
  { email: "bernard.outo@konoha.com", last_name: "Outo", password: "azerty" },
  { email: "bernard.cotrafiquant@medellin.com", last_name: "Cotrafiquant", password: "azerty" },
  { email: "nanar.l'hermite@coquille.com", last_name: "l'hermite", password: "azerty" },
  { email: "bernard.arnault@lvmh.com", last_name: "Arnault", password: "azerty" },
  { email: "owner@bernard.com", last_name: "owner", password: "azerty" },
]

user_attributes.each do |user_attribute|
  User.create(user_attribute)
end
puts "#{User.count} users created"

#-----------------------------------------------

Offer.destroy_all
puts "All offers were destroyed"

offer_attributes = [
  { title: "Huge shell to rent", location: "Rio beach", price: 200, user: User.last, image: "bernard_villa.jpeg" },
  { title: "Crabs love it", location: "Near to the docks", price: 120, user: User.third, image: "bernard_sprite.jpeg" },
  { title: "Comfy shell", location: "In an airplane", price: 130, user: User.last, image: "bernard_ombrelle.jpeg" },
  { title: "Cheap shell", location: "Coral forest", price: 45, user: User.second, image: "bernard_etudiant.jpg" },
  { title: "Luxury shell", location: "Seaweed fields", price: 500, user: User.second, image: "bernard_or.jpeg" },
  { title: "Double bedroom shell", location: "Pyla Dune", price: 150, user: User.last, image: "bernard_lunettes.jpeg" },
  { title: "Dowtown shell", location: "Arcachon", price: 115, user: User.third, image: "bernard_pauvre.jpeg" }
]

offer_attributes.each do |offer_attribute|
  Offer.create(offer_attribute)
end
puts "#{Offer.count} offers created"

#-----------------------------------------------

Booking.destroy_all
puts "All bookings were destroyed"

booking_attributes = [
  { start_date: "10/03/2024", end_date: "14/03/2024", accepted: nil, offer: Offer.last, user: User.first },
  { start_date: "10/03/2024", end_date: "14/03/2024", accepted: true, offer: Offer.last, user: User.second }
]

booking_attributes.each do |booking_attribute|
  Booking.create(booking_attribute)
end
puts "#{Booking.count} bookings created"
