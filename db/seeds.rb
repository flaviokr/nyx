# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'Flavio', email: 'flavio@flavio.com', rf: '1234567', 
            celular: '78994561', comunicador: '78945612', admin: true, 
            password_digest: 'senha123')
