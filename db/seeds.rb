# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Destroying votes, decisions, meetings, documents, chatmembers, chatrooms, coproperties, and users"
Vote.destroy_all
Decision.destroy_all
Meeting.destroy_all
Document.destroy_all
ChatMember.destroy_all
Chatroom.destroy_all
Coproperty.destroy_all
User.destroy_all
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

user3 = User.new(first_name: "Jean", last_name: "Lefevre", email: "jean@gmail.com", password: "testdemdp", status: false, square_meters: 100)
user3.coproperty = coproperty1
user3.save!
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
document1 = Document.new(name: "Devis travaux", tag: "devis", documentable: meeting2, user: user1, coproperty: coproperty1)
file1 = File.open(Rails.root.join("app/assets/images/seeds/devis.jpg"))
document1.file.attach(io: file1, filename: "devis.jpg", content_type: "image/jpg")
document1.save!

document2 = Document.new(name: "Devis ascenseur", tag: "devis", documentable: meeting2, user: user1, coproperty: coproperty1)
file2 = File.open(Rails.root.join("app/assets/images/seeds/ascenseur.jpeg"))
document2.file.attach(io: file2, filename: "ascenseur.jpeg", content_type: "image/jpeg")
document2.save!

document3 = Document.new(name: "Devis poubelles", tag: "devis", documentable: meeting1, user: user1, coproperty: coproperty1)
file3 = File.open(Rails.root.join("app/assets/images/seeds/poubelles.jpg"))
document3.file.attach(io: file3, filename: "poubelles.jpg", content_type: "image/jpg")
document3.save!

puts "Done creating documents"

puts "Creating chatrooms"
chatroom1 = Chatroom.new(coproperty: coproperty1)
chatroom1.save!
chatroom2 = Chatroom.new(coproperty: coproperty1)
chatroom2.save!
puts "Done creating chatrooms"

puts "Creating chatmembers"
chatmember1 = ChatMember.new(user: user1, chatroom: chatroom1)
chatmember1.save!
chatmember2 = ChatMember.new(user: user2, chatroom: chatroom1)
chatmember2.save!
chatmember3 = ChatMember.new(user: user3, chatroom: chatroom2)
chatmember3.save!
chatmember4 = ChatMember.new(user: user1, chatroom: chatroom2)
chatmember4.save!
puts "Done creating chatmembers"

puts "Seed done"
