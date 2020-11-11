# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Running seeds"
    Employee.create([{ name: 'NN', phone: '676780254', cash: 0, description: "Cuenta d Naranjas Naranjas" }])
#    roque = Employee.create(name: 'Faggotier', phone: '629118235', credit: -7800, description: "Con esa duda no hay que dudar")
    Employee.create(name: 'Gayguel', phone: '', cash: 0, description: "Tod me he was going to get 50 ppl")

    Landlord.create(name: 'Jorge', phone: '62901867', address: "Valencia Road", description: "Solo las Navelinas", fields: 3)

puts "done"