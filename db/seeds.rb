puts "Destroying votes, decisions, meetings, documents, messages, chatmembers, chatrooms, coproperties, and users"
Vote.destroy_all
Decision.destroy_all
Meeting.destroy_all
Document.destroy_all
Message.destroy_all
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
user1.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/Irina.png")),
  filename: 'anyname.jpg',
  content_type: 'image/jpg'
)
user1.coproperty = coproperty1
user1.save!

user2 = User.new(first_name: "Glenda", last_name: "John", email: "glenda@gmail.com", password: "testdemdp", status: false, square_meters: 120)
user2.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/Glenda.png")),
  filename: 'anyname.jpg',
  content_type: 'image/jpg'
)
user2.coproperty = coproperty1
user2.save!

user3 = User.new(first_name: "Jean", last_name: "Lefevre", email: "jean@gmail.com", password: "testdemdp", status: false, square_meters: 100)
user3.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/Jean.png")),
  filename: 'anyname.jpg',
  content_type: 'image/jpg'
)
user3.coproperty = coproperty1
user3.save!

user4 = User.new(first_name: "Antoine", last_name: "Jeanjean", email: "antoine@gmail.com", password: "testdemdp", status: false, square_meters: 70)
user4.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/Antoine.png")),
  filename: 'anyname.jpg',
  content_type: 'image/jpg'
)
user4.coproperty = coproperty1
user4.save!

user5 = User.new(first_name: "Brigitte & Manu", last_name: "De Guerin", email: "brinu@gmail.com", password: "testdemdp", status: false, square_meters: 270)
user5.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/Brigitte&Manu.png")),
  filename: 'anyname.jpg',
  content_type: 'image/jpg'
)
user5.coproperty = coproperty1
user5.save!

user6 = User.new(first_name: "Claire", last_name: "Joly", email: "claire@gmail.com", password: "testdemdp", status: false, square_meters: 270)
user6.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/Claire.png")),
  filename: 'anyname.jpg',
  content_type: 'image/jpg'
)
user6.coproperty = coproperty1
user6.save!

users = [
  {
    email: "juliette@gmail.com",
    password: "testdemdp",
    first_name: "Juliette",
    last_name: "Danielczyk",
    status: false,
    square_meters: 100
  },
  {
    email: "gil@gmail.com",
    password: "testdemdp",
    first_name: "Gil",
    last_name: "Dayan",
    status: false,
    square_meters: 200
  },
  {
    email: "flore@gmail.com",
    password: "testdemdp",
    first_name: "Flore",
    last_name: "de Paillerets",
    status: false,
    square_meters: 100
  },
  {
    email: "laura@gmail.com",
    password: "testdemdp",
    first_name: "Laura",
    last_name: "Mendelzon",
    status: false,
    square_meters: 200
  }
]

users.each do |user|
  u = User.create!(user.merge(coproperty: coproperty1))
  u.photo.attach(
    io: File.open(Rails.root.join("app/assets/images/#{u.first_name}.png")),
    filename: "#{u.first_name}.png",
    content_type: 'image/png'
  )
end

puts "Done creating users"

puts "Creating meetings"

meeting1 = Meeting.new(title: "Réunion d'urgence", date: Date.current, description: "Trois points à aborder: local poubelles, conciergerie et tapage nocturne")
meeting1.user = user1
meeting1.coproperty = coproperty1
meeting1.save!

meeting2 = Meeting.new(title: "Réunion ascenseur", date: Date.current - 17.months, description: "Travaux ascenseur")
meeting2.user = user1
meeting2.coproperty = coproperty1
meeting2.save!

meeting3 = Meeting.new(title: "AG 2024", date: Date.current - 5.months, description: "AG 2024 pour ravalement de façade")
meeting3.user = user1
meeting3.coproperty = coproperty1
meeting3.save!

puts "Done creating meetings"

puts "Creating decisions"
decision1 = Decision.new(title: "Local poubelles - Devis 1", description: "Entreprise Lauret. Total: 15000", user: user1, meeting: meeting1, status: 0)
decision1.save!
decision2 = Decision.new(title: "Local poubelles - Devis 2", description: "Entreprise Marta. Total: 16000", user: user1, meeting: meeting1, status: 0)
decision2.save!
decision3 = Decision.new(title: "Conciergerie", description: "Changer de concierge", user: user1, meeting: meeting1, status: 0)
decision3.save!
puts "Done creating decisions"

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
chatroom3 = Chatroom.new(coproperty: coproperty1, name: "Copropriété")
chatroom3.save!
chatroom4 = Chatroom.new(coproperty: coproperty1)
chatroom4.save!
chatroom5 = Chatroom.new(coproperty: coproperty1)
chatroom5.save!
chatroom6 = Chatroom.new(coproperty: coproperty1)
chatroom6.save!
puts "Done creating chatrooms"

messages = [
  "N'oublie pas la fête des voisins!",
  "N'oublie pas la fête des voisins!",
  "N'oublie pas la fête des voisins!",
  "N'oublie pas la fête des voisins!"
]

users.each_with_index do |user, index|
  chatroom = Chatroom.create!(coproperty: coproperty1)
  cm_1 = ChatMember.create!(user: User.find_by(email: user[:email]), chatroom: chatroom)
  cm_2 = ChatMember.create!(user: user1, chatroom: chatroom)
  Message.create!(chatroom: chatroom,content: messages[index], chat_member: cm_2)
end

puts "Creating chatmembers"
chatmember1 = ChatMember.new(user: user1, chatroom: chatroom1)
chatmember1.save!
chatmember2 = ChatMember.new(user: user2, chatroom: chatroom1)
chatmember2.save!
chatmember3 = ChatMember.new(user: user3, chatroom: chatroom2)
chatmember3.save!
chatmember4 = ChatMember.new(user: user1, chatroom: chatroom2)
chatmember4.save!

chatmember5 = ChatMember.new(user: user1, chatroom: chatroom3)
chatmember5.save!
chatmember6 = ChatMember.new(user: user2, chatroom: chatroom3)
chatmember6.save!
chatmember7 = ChatMember.new(user: user3, chatroom: chatroom3)
chatmember7.save!
chatmember8 = ChatMember.new(user: user4, chatroom: chatroom3)
chatmember8.save!
chatmember9 = ChatMember.new(user: user5, chatroom: chatroom3)
chatmember9.save!
chatmember10 = ChatMember.new(user: user6, chatroom: chatroom3)
chatmember10.save!
users.each do |u|
  user = User.find_by(email: u[:email])
  ChatMember.create!(user: user, chatroom: chatroom3)
end

chatmember11 = ChatMember.new(user: user1, chatroom: chatroom4)
chatmember11.save!
chatmember12 = ChatMember.new(user: user4, chatroom: chatroom4)
chatmember12.save!

chatmember13 = ChatMember.new(user: user1, chatroom: chatroom5)
chatmember13.save!
chatmember14 = ChatMember.new(user: user5, chatroom: chatroom5)
chatmember14.save!

chatmember15 = ChatMember.new(user: user1, chatroom: chatroom6)
chatmember15.save!
chatmember15 = ChatMember.new(user: user6, chatroom: chatroom6)
chatmember15.save!

puts "Done creating chatmembers"

puts "Creating messages"
message1 = Message.new(chatroom: chatroom1,content: "J'ai bien déposé les clés", chat_member: chatmember2)
message1.save!
message2 = Message.new(chatroom: chatroom1,content: "Pense à ajouter une décision à la réunion", chat_member: chatmember1)
message2.save!
message3 = Message.new(chatroom: chatroom1,content: "N'oublie pas la fête des voisins!", chat_member: chatmember2)
message3.save!
message4 = Message.new(chatroom: chatroom1,content: "Il y a encore des rats dans le local poubelles", chat_member: chatmember1)
message4.save!
puts "Done creating messages"

puts "Seed done"
