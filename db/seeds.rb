# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Destroying users, coproperties, meetings and documents"
User.destroy_all
Coproperty.destroy_all
Meeting.destroy_all
Document.destroy_all
puts "Done destroying"

puts "Creating coproperty"
coproperty1 = Coproperty.new(name: "123 Rue de la Coproriété, 75013 Paris", total_surface: 1000)
puts "Done creating coproperty"

puts "Creating users"
user1 = User.new(first_name: "Irina", last_name: "De Santos", email: "irina@gmail.com", password: "testdemdp", status: true, square_meters: 240)
user1.coproperty = coproperty1
user1.save!

user2 = User.new(first_name: "Glenda", last_name: "John", email: "glenda@gmail.com", password: "testdemdp", status: false, square_meters: 120)
user2.coproperty = coproperty1
user2.save!
puts "Done creating users"

puts "Creating meetings"
meeting1 = Meeting.new(title: "AG 2024", date: Date.current - 5.months, description: "AG 2024 pour ravalement de façade")
meeting1.user = user1
meeting1.coproperty = coproperty1
meeting1.save!

meeting2 = Meeting.new(title: "Réunion ascenseur", date: Date.current - 17.months, description: "Travaux ascenseur")
meeting2.user = user1
meeting2.coproperty = coproperty1
meeting2.save!
puts "Done creating meetings"

puts "Creating documents"
document1 = Document.create!(name: "Devis travaux", tag: "devis")
document1.user = user1
document1.coproperty = user1.coproperty_id
file1 = File.open(Rails.root.join("app/assets/images/seeds/devis.jpg"))
document1.file.attach(io: file1, filename: "devis.jpg", content_type: "image/jpg")

document2 = Document.create!(name: "Devis travaux", tag: "devis")
document2.user = user1
document2.coproperty = user1.coproperty_id
file2 = File.open(Rails.root.join("app/assets/images/seeds/ascenseur.jpg"))
document2.file.attach(io: file2, filename: "ascenseur.jpg", content_type: "image/jpg")

document3 = Document.create!(name: "Devis travaux", tag: "devis")
document3.user = user1
document3.coproperty = user1.coproperty_id
file3 = File.open(Rails.root.join("app/assets/images/seeds/poubelles.jpg"))
document2.file.attach(io: file3, filename: "poubelles.jpg", content_type: "image/jpg")

puts "Done creating documents"
puts "Seed done"
