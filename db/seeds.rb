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
user1 = User.new(first_name: "TDM", last_name: "De Santos", email: "irina@gmail.com", password: "testdemdp", status: true, square_meters: 240)
user1.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/tdm.png")),
  filename: 'anyname.jpg',
  content_type: 'image/jpg'
)
user1.coproperty = coproperty1
user1.save!
user2 = User.new(first_name: "Mathieu", last_name: "John", email: "glenda@gmail.com", password: "testdemdp", status: false, square_meters: 120)
user2.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/mathieu.png")),
  filename: 'anyname.jpg',
  content_type: 'image/jpg'
)
user2.coproperty = coproperty1
user2.save!
user3 = User.new(first_name: "Jean", last_name: "Lefevre", email: "jean@gmail.com", password: "testdemdp", status: false, square_meters: 100)
user3.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/Jeann.png")),
  filename: 'anyname.jpg',
  content_type: 'image/jpg'
)
user3.coproperty = coproperty1
user3.save!
user4 = User.new(first_name: "Antoine", last_name: "Jeanjean", email: "antoine@gmail.com", password: "testdemdp", status: false, square_meters: 70)
user4.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/Antoinee.png")),
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
user6 = User.new(first_name: "Alvaro", last_name: "Joly", email: "claire@gmail.com", password: "testdemdp", status: false, square_meters: 270)
user6.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/Alvaro.png")),
  filename: 'anyname.jpg',
  content_type: 'image/jpg'
)
user6.coproperty = coproperty1
user6.save!

users = [
  {
    email: "juliette@gmail.com",
    password: "testdemdp",
    first_name: "Erwann",
    last_name: "Danielczyk",
    status: false,
    square_meters: 100
  },
  {
    email: "gil@gmail.com",
    password: "testdemdp",
    first_name: "Vivi",
    last_name: "Dayan",
    status: false,
    square_meters: 200
  },
  {
    email: "flore@gmail.com",
    password: "testdemdp",
    first_name: "Gil",
    last_name: "de Paillerets",
    status: false,
    square_meters: 100
  },
  {
    email: "laura@gmail.com",
    password: "testdemdp",
    first_name: "Bruno",
    last_name: "Mendelzon",
    status: false,
    square_meters: 200
  }
]
users.each do |user|
  u = User.create!(user.merge(coproperty: coproperty1))
  u.photo.attach(
    io: File.open(Rails.root.join("app/assets/images/#{u.first_name.downcase}.png")),
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
# meeting2 = Meeting.new(title: "Réunion ascenseur", date: Date.current - 17.months, description: "Travaux ascenseur")
# meeting2.user = user1
# meeting2.coproperty = coproperty1
# meeting2.save!
meeting3 = Meeting.new(title: "AG 2025", date: Date.current + 5.months, description: "AG 2024 pour ravalement de façade")
meeting3.user = user1
meeting3.coproperty = coproperty1
meeting3.save!
puts "Done creating meetings"
puts "Creating decisions"
decision1 = Decision.new(title: "Local poubelles - Devis 1", description: "Entreprise Lauret. Total: 15000", user: user1, meeting: meeting3, status: 0)
decision1.save!
decision2 = Decision.new(title: "Local poubelles - Devis 2", description: "Entreprise Marta. Total: 16000", user: user1, meeting: meeting3, status: 0)
decision2.save!
decision3 = Decision.new(title: "Conciergerie", description: "Changer de concierge", user: user1, meeting: meeting3, status: 0)
decision3.save!
puts "Done creating decisions"
puts "Creating documents"
document1 = Document.new(name: "Devis travaux", tag: "devis", documentable: meeting3, user: user1, coproperty: coproperty1)
file1 = File.open(Rails.root.join("app/assets/images/seeds/devis.jpg"))
document1.file.attach(io: file1, filename: "devis.jpg", content_type: "image/jpg")
document1.save!
document2 = Document.new(name: "Devis ascenseur", tag: "devis", documentable: meeting3, user: user1, coproperty: coproperty1)
file2 = File.open(Rails.root.join("app/assets/images/seeds/ascenseur.jpeg"))
document2.file.attach(io: file2, filename: "ascenseur.jpeg", content_type: "image/jpeg")
document2.save!
document3 = Document.new(name: "Devis poubelles", tag: "devis", documentable: meeting1, user: user1, coproperty: coproperty1)
file3 = File.open(Rails.root.join("app/assets/images/seeds/poubelles.jpg"))
document3.file.attach(io: file3, filename: "poubelles.jpg", content_type: "image/jpg")
document3.save!
document4 = Document.new(name: "Compte rendu AG 2023", tag: "CR", user: user1, coproperty: coproperty1)
file4 = File.open(Rails.root.join("app/assets/images/seeds/poubelles.jpg"))
document4.file.attach(io: file4, filename: "poubelles.jpg", content_type: "image/jpg")
document4.save!
document5 = Document.new(name: "Compte rendu AG 2022", tag: "CR", user: user1, coproperty: coproperty1)
file5 = File.open(Rails.root.join("app/assets/images/seeds/poubelles.jpg"))
document5.file.attach(io: file5, filename: "poubelles.jpg", content_type: "image/jpg")
document5.save!
document6 = Document.new(name: "Reglement de la copropriété", tag: "General", user: user1, coproperty: coproperty1)
file6 = File.open(Rails.root.join("app/assets/images/seeds/poubelles.jpg"))
document6.file.attach(io: file6, filename: "poubelles.jpg", content_type: "image/jpg")
document6.save!
document7 = Document.new(name: "Carnet d'entretien", tag: "General", user: user1, coproperty: coproperty1)
file7 = File.open(Rails.root.join("app/assets/images/seeds/poubelles.jpg"))
document7.file.attach(io: file7, filename: "poubelles.jpg", content_type: "image/jpg")
document7.save!
document8 = Document.new(name: "Diagnostic technique", tag: "General", user: user1, coproperty: coproperty1)
file8 = File.open(Rails.root.join("app/assets/images/seeds/poubelles.jpg"))
document8.file.attach(io: file8, filename: "poubelles.jpg", content_type: "image/jpg")
document8.save!
document9 = Document.new(name: "Diagnostic energetique", tag: "General", user: user1, coproperty: coproperty1)
file9 = File.open(Rails.root.join("app/assets/images/seeds/poubelles.jpg"))
document9.file.attach(io: file9, filename: "poubelles.jpg", content_type: "image/jpg")
document9.save!
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
chatroom7 = Chatroom.new(coproperty: coproperty1)
chatroom7.save!
chatroom8 = Chatroom.new(coproperty: coproperty1)
chatroom8.save!
chatroom9 = Chatroom.new(coproperty: coproperty1)
chatroom9.save!
chatroom10 = Chatroom.new(coproperty: coproperty1)
chatroom10.save!
puts "Done creating chatrooms"
messages = [
  "Chaud pour une bière?",
  "C'est pas toi qui a mon tee-shirt playstation?",
  "Tu aurais pas un micro pour un karaoké?",
  "Tu peux baisser le son ????"
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
chatmember16 = ChatMember.new(user: user6, chatroom: chatroom6)
chatmember16.save!
chatmember17 = ChatMember.new(user: user2, chatroom: chatroom7)
chatmember17.save!
chatmember18 = ChatMember.new(user: user3, chatroom: chatroom7)
chatmember18.save!
chatmember19 = ChatMember.new(user: user2, chatroom: chatroom8)
chatmember19.save!
chatmember20 = ChatMember.new(user: user4, chatroom: chatroom8)
chatmember20.save!
chatmember21 = ChatMember.new(user: user2, chatroom: chatroom9)
chatmember21.save!
chatmember22 = ChatMember.new(user: user5, chatroom: chatroom9)
chatmember22.save!
chatmember23 = ChatMember.new(user: user2, chatroom: chatroom10)
chatmember23.save!
chatmember24 = ChatMember.new(user: user6, chatroom: chatroom10)
chatmember24.save!
puts "Done creating chatmembers"
puts "Creating messages"
message1 = Message.new(chatroom: chatroom1,content: "J'ai bien déposé les clés", chat_member: chatmember2)
message1.save!
message2 = Message.new(chatroom: chatroom8,content: "Pense à ajouter une décision à la réunion", chat_member: chatmember19)
message2.save!
message3 = Message.new(chatroom: chatroom7,content: "N'oublie pas la fête des voisins!", chat_member: chatmember18)
message3.save!
message4 = Message.new(chatroom: chatroom6,content: "Pour ton mal de crane, j'ai demandé à chatgpt, je pense que c'est une grippe", chat_member: chatmember15)
message4.save!
message5 = Message.new(chatroom: chatroom2,content: "J'ai perdu mon liquide de CE, tu en as en rab??", chat_member: chatmember3)
message5.save!
message6 = Message.new(chatroom: chatroom3,content: "Qui a laissé les poubelles dans l'ascenseur !!", chat_member: chatmember4)
message6.save!
message7 = Message.new(chatroom: chatroom4,content: "Need some doliprane", chat_member: chatmember11)
message7.save!
message8 = Message.new(chatroom: chatroom5,content: "T'as pas du sucre?", chat_member: chatmember14)
message8.save!
message9 = Message.new(chatroom: chatroom9,content: "Je pars au ski t'as une doudoune pour moi?", chat_member: chatmember21)
message9.save!


message10 = Message.new(chatroom: chatroom10,content: "Soirée Koh Lanta ce soir ! ", chat_member: chatmember24)
message10.save!
puts "Done creating messages"
puts "Seed done"
