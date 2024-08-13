# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



attributes = [
  { email: "bernard.tapie@coquille.com", last_name: "Tapie" },
  { email: "bernard.ebianca@disney.com", last_name: "Ebianca" },
  { email: "bernard.outo@konoha.com", last_name: "Outo" },
  { email: "bernard.cotrafiquant@medellin.com", last_name: "Cotrafiquant" },
  { email: "nanar.l'hermite@coquille.com", last_name: "l'hermite" },
  { email: "bernard.arnault@lvmh.com", last_name: "Arnault" }
]
attributes.each do |attribute|
  user = User.create(attribute)
end
puts "#{User.count} users created"
