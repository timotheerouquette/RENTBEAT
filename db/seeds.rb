# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#user1 = User.new(name: "Océane Lucas",
#                 email: "oceane@mail.com",
#                 password: "oceane",
#                 description: "Music producer",
#                 avatar: "https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=518&q=80"
#                 )

#user1.save!

Booking.destroy_all
Studio.destroy_all


user1 = User.find(1)


studio1 = Studio.new(address: "74 boulevard du Montparnasse 75014 Paris" ,
            title: "Pop Music Studio",
            description: "State-of-the-art recording, mixing, and mastering facility located in the heart of Paris. This space is purpose-built for audio production. The studio features a bespoke studio outboard for shaping and tuning sounds. ",
            price: 45,
            capacity: 8,
            user_id: user1[:id]
          )

studio1.save!

studio2 = Studio.new( address: "74 boulevard du Montparnasse 75014 Paris" ,
            title: "Parc Studio",
            description: "Parc studio is a truly one-of-a-kind musical sanctuary, converted from a classic cinema built in the 1970s. The suite offers a space to edit, create, record independently or CONNECT with our other suites.",
            price: 55,
            capacity: 10,
            user_id: user1[:id]
          )

studio2.save!

studio3 = Studio.new( address: "74 avenue Paul Doumer 75016 Paris" ,
            title: "Live Studio",
            description: "Write, record, and produce efficiently, with sessions operating in both rooms simultaneously. Premium studio space in the heart of Paris, featuring extra large control room, booth and private lounge. Sony C800g microphone with classic Neve 1073 and Tube-Tech CL1B vocal chain. Convenient workspace, fully soundproofed and acoustically treated.",
            price: 60,
            capacity: 9,
            user_id: user1[:id]
          )

studio3.save!

studio4 = Studio.new( address: "8 rue du four 75006 Paris"  ,
            title: "Podcast Studio",
            description: "Best recording spot for all of your professional needs. Our dedicated audio recording suite Designed for recording podcasts, voice-overs, vocals and instruments. Alongside a professional mic selection and the latest podcasting hardware, LIVE has custom-built “suspended” equipment.",
            price: 65,
            capacity: 10,
            user_id: user1[:id]
          )

studio4.save!

studio5 = Studio.new( address: "131 rue de la boétie 75008 Paris" ,
            title: "Studio soundproof tech ",
            description: "Comfortable, air conditioned, private, acoustically treated pro 18 x 12' natural-light control room with Mackie HR824 & Yamaha NOUS-10M monitoring (great for critical listening/mixing), and 18' x 6' floated is  booth; Perfect for co-writing, building tracks, cutting vocals, live instruments and mixing. ",
            price: 75,
            capacity: 8,
            user_id: user1[:id]
          )

studio5.save!
