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
Coproperty.destroy_all
Meeting.destroy_all

coproperty1 = Coproperty.create!(name: "123 Rue de la Coproriété, 75013 Paris", total_surface: 1000)
user1 = User.create!(first_name: "Irina", last_name: "De Santos", email: "irina@gmail.com", password: "testdemdp", status: true, sqquare_meters: 240)
user1.coproperty = coproperty1
user1.save!

user2 = User.create!(first_name: "Glenda", last_name: "John", email: "glenda@gmail.com", password: "testdemdp", status: false, sqquare_meters: 120)
user2.coproperty = coproperty1
user2.save!

meeting1 = Meeting.create!(title: "AG 2024", date: Date.current - 5.months, description: "AG 2024 pour ravalement de façade")
meeting1.user = user1
meeting1.coproperty = coproperty1
meeting1.save!

meeting2 = Meeting.create!(title: "Réunion ascenseur", date: Date.current - 17.months, description: "Travaux ascenseur")
meeting2.user = user1
meeting2.coproperty = coproperty1
meeting2.save!

#document1 = Document.create!(name: "Devis travaux", tag: "devis")
