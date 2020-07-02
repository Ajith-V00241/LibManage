# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

b1 = Book.create(title: "American Sniper", author: "Chris Kyle, Scott McEwen, Jim DeFelice", description: "A memoir about battlefield experiences in Iraq by the Navy SEALs sniper.", publisher: "Morrow/HarperCollins", language: "English", image:"/assets/AmericanSniper.jpg", totalBooks: 10, availableBooks: 10)
b2 = Book.create(title: "Unbroken", author: "Laura Hillenbrand", description: "An Olympic runnerâ€™s story of survival as a prisoner of the Japanese in World War II after his plane went down over the Pacific.", publisher: "Random House", language: "English", image:"/assets/UnBroken.jpg", totalBooks: 10, availableBooks: 10)
b3 = Book.create(title: "Wild", author: "Cheryl Strayed", description: "A womanâ€™s account of the life-changing 1,100-mile solo hike she took along the Pacific Crest Trail in 1995.", publisher: "Vintage", language: "English", image:"/assets/Wild.jpg", totalBooks: 10, availableBooks: 10)
b4 = Book.create(title: "The Boys in the Boat", author: "Daniel James", description: "A group of American rowers pursued gold at the 1936 Berlin Olympic Games.", publisher: "Penguin", language: "English", image:"/assets/TheBoysintheBoat.jpg", totalBooks: 10, availableBooks: 10)
b5 = Book.create(title: "Alan Turing: The Enigma", author: "Andrew Hodges", description: "The presiding mathetmatician and decoding force at Bletchley Park, the center that cracked the German Enigma code,", publisher: "Princeton University", language: "English", image:"/assets/AlanTuringTheEnigma.jpg", totalBooks: 10, availableBooks: 10)
b6 = Book.create(title: "Outliers", author: "Malcolm Gladwell", description: "Why some people succeed â€” it has to do with luck and opportunities as well as talent.", publisher: "Back Bay/Little, Brown", language: "English", image:"/assets/Outliers.jpg", totalBooks: 10, availableBooks: 10)
b7 = Book.create(title: "The Power of Habit", author: "Charles Duhigg", description: "An examinatino of the science behind habits, how we form them and break them.", publisher: "Random House", language: "English", image:"/assets/ThePowerofHabit.jpg", totalBooks: 10, availableBooks: 10)
b8 = Book.create(title: "A Brief History of Time", author: "Stephen W. Hawking", description: "The British cosmologist reviews efforts to create a unified theory of the universe.", publisher: "Bantam", language: "English", image:"/assets/ABriefHistoryofTime.jpg", totalBooks: 10, availableBooks: 10)
b9 = Book.create(title: "10% Happier", author: "Dan Harris", description: "A co-anchor of \"Nightline\" reports on the science and spiritual basis of meditation and how it has improved his life.", publisher: "Dey St.", language: "English", image:"/assets/10percentHappier.jpg", totalBooks: 10, availableBooks: 10)
b10 = Book.create(title: "The New Jim Crow", author: "Michelle Alexander", description: "A law professor takes aim at the â€œwar on drugsâ€ and its impact on black men.", publisher: "New Press", language: "English", image:"/assets/TheNewJimCrow.jpg", totalBooks: 10, availableBooks: 10)

a1 = Admin.create(email:"bookmanager@libmanage.com", password: "libmanage", name:"Karthikeyan", role:"BookManager", phone:"9876555522",address:"121/B, ABC Flats, Madurai")
a2 = Admin.create(email:"requestadmin@libmanage.com", password: "libmanage", name:"Madhavi", role:"RequestAdmin", phone:"9824943410",address:"120/C, FILA Flats, Ooty")

u1 = User.create(email: "arun@example.com", password: "ArunMani", password_confirmation: "ArunMani", name: "Arun Mani", date_of_membership: "2020-06-26 13:38:09", totalcheckout: 0, phone: "9894976149", address: "10, T-Nagar, Chennai")
u2 = User.create(email: "gavin@example.com", password: "goutham", password_confirmation: "goutham", name: "Gavin Goutham", date_of_membership: "2020-08-26 13:38:09", totalcheckout: 0, phone: "9892354349", address: "10, Usman road, Coimbatore")
u3 = User.create(email: "ajith@example.com", password: "123456", password_confirmation: "123456" , name: "Ajith Mani.V", date_of_membership: "2020-01-01 13:38:09", totalcheckout: 0, phone: "9566371149", address: "319, Madhakottai Road, Thanjavur")
