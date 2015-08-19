# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
hardware = Categoria.create(nome:'Hardware')
software = Categoria.create(nome:'Software')
rede = Categoria.create(nome:'Rede')

Objeto.create!(nome:'Impressora', categoria: hardware)
Objeto.create(nome:'Teclado',categoria: hardware)
Objeto.create(nome:'Formatação',categoria: hardware)
Objeto.create(nome:'Montagem de PC',categoria: hardware)
Objeto.create(nome:'Mouse',categoria: hardware)
Objeto.create(nome:'Tonner',categoria: hardware)
Objeto.create(nome:'Monitor',categoria: hardware)
Objeto.create(nome:'Outros',categoria: hardware)


Objeto.create(nome:'Office',categoria:software)
Objeto.create(nome:'Dataease',categoria:software)
Objeto.create(nome:'Simproc',categoria:software)
Objeto.create(nome:'Configuração inicial do PC',categoria:software)
Objeto.create(nome:'Oracle',categoria:software)
Objeto.create(nome:'ARCetil',categoria:software)
Objeto.create(nome:'Atualizações de Software',categoria:software)
Objeto.create(nome:'Configurar Banco',categoria:software)
Objeto.create(nome:'Tidi',categoria:software)


Objeto.create(nome:'Configuração de Login/Senha',categoria:rede)
Objeto.create(nome:'Configuração de Internet',categoria:rede)
Objeto.create(nome:'Servidor',categoria:rede)
Objeto.create(nome:'Configuração de Perfil na Rede',categoria:rede)
