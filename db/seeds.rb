Plant_List.destroy_all
User.destroy_all
Plant.destroy_all

shade=["Full Sun","Partial Sun","Partial Shade","Full Shade"]
size=["Small","Medium","Large"]
water=["Once a week","Multiple Times a Weeks","As Needed"]
environment= ["Dry","Humid","Moderate"]
plants= ["Aloe Vera","Yucca","Spider Plant","Peace Lily","English Ivy",
"Rubber Plant","Philodendron","Cactus","Snake Plant","Dieffenbachia","Fiddle Leaf Fig",
"Chinese Money Plant","African Violet"]

5.times do

    User.create(
    name: Faker::Name.name ,
    email: Faker::Internet.unique.email ,
    phone_number: Faker::PhoneNumber.cell_phone ,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode:Faker::Address.zip_code ,
    password: "password")

end

10.times do

    Plant.create(
        name: plants.uniq.sample,
        species: "Not Specified",
        sunlight_needs: shade.sample ,
        watering_needs: water.sample ,
        best_environment: environment.sample

    )

end


30.times do

    Plant_List.create(
       
        plant: Plant.all.sample,
        user: User.all.sample,
        list_name: "My Plants",
        plant_nickname: "Give Your Plant a Nickname!",
        size: size.sample ,
        notes_on_tending: "User hasn't entered Notes"
    )

end

puts "We did it Joe"