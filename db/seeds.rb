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

chatmember5 = ChatMember.new(user: user1, chatroom: chatroom3)
chatmember5.save!
chatmember6 = ChatMember.new(user: user2, chatroom: chatroom3)
chatmember6.save!
chatmember7 = ChatMember.new(user: user3, chatroom: chatroom3)
chatmember7.save!
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
