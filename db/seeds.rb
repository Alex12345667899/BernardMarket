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
puts "All Bernards were destroyed, DB is empty"

attributes = [
  { email: "bernard.tapie@coquille.com", last_name: "Tapie", password: "azerty" },
  { email: "bernard.ebianca@disney.com", last_name: "Ebianca", password: "azerty" },
  { email: "bernard.outo@konoha.com", last_name: "Outo", password: "azerty" },
  { email: "bernard.cotrafiquant@medellin.com", last_name: "Cotrafiquant", password: "azerty" },
  { email: "nanar.l'hermite@coquille.com", last_name: "l'hermite", password: "azerty" },
  { email: "bernard.arnault@lvmh.com", last_name: "Arnault", password: "azerty" }
]
attributes.each do |attribute|
  User.create(attribute)
end
puts "#{User.count} users created"
