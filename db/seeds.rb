# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Offer.destroy_all

Offer.create!([{
  offer_name: "offer_1",
  location: "50% discount in sofa cleaning",
  phone: "+971 356 657",
  description: "offering effecient cleaning with 50%"
	},
	offer_name: "offer_2",
  location: "40% discount in sofa dry cleaning",
  phone: "+971 356 567",
  description: "offering effecient cleaning with 40%"
	},
	offer_name: "offer_3",
  location: "30% discount in sofa ironing",
  phone: "+971 232 657",
  description: "offering effecient cleaning with 30%"
	},

])

p "Created #{Offer.count} offers"

Service.destroy_all

Service.create!([{
  service_name: "Wash & dry",
  description: "We use Imported Machines and Eco Friendly detergents to take care of your fabric . . ."
},
  service_name: "Steam ironing",
  description: "We curve your fabric with Steam Iron to ensure no more wrinkles upon them . . ."
},
  service_name: "Dry cleaning",
  description: "We offers best in class dry cleaning service retaining the freshness of your fabric . . ."
},

])

p "Created #{Service.count} services"