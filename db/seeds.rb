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

User.create(rf:'0000000', name: 'Administrador',admin: true, password: '123456', email: 'adm@adm.com', celular: '0000', comunicador: '0000')
User.create(rf:'f002814', name: 'Alexandre Henrique',admin: false, password: 'nyx123', email: 'ahmbasilio@prefeitura.sp.gov.br', celular: '0000', comunicador: '0000')
User.create(rf:'f002651', name: 'Daniel Sonni',admin: false, password: 'nyx123', email: 'danielssilva@prefeitura.sp.gov.br', celular: '0000', comunicador: '0000')
User.create(rf:'f002626', name: 'Handré Padro',admin: false, password: 'nyx123', email: 'handreprado@prefeitura.sp.gov.br', celular: '0000', comunicador: '0000')
User.create(rf:'f002807', name: 'Lucas Silva',admin: false, password: 'nyx123', email: 'lucascsilva@prefeitura.sp.gov.br', celular: '0000', comunicador: '0000')

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

Sector.create(nome:'Agência Araçá')
Sector.create(nome:'Agência Central')
Sector.create(nome:'Agência Itaquera')
Sector.create(nome:'Agência Lapa')
Sector.create(nome:'Agência Qta. Parada')
Sector.create(nome:'Agência  Santana')
Sector.create(nome:'Agência  Sto. Amaro')
Sector.create(nome:'Agência  Saudade')
Sector.create(nome:'Agência  Servidor Municipal')
Sector.create(nome:'Agência  Vila Formosa')
Sector.create(nome:'Cemitério Araçá')
Sector.create(nome:'Cemitério Campo Grande')
Sector.create(nome:'Cemitério Consolação')
Sector.create(nome:'Cemitério Dom Bosco')
Sector.create(nome:'Cemitério Freguesia Do Ó')
Sector.create(nome:'Cemitério Itaquera')
Sector.create(nome:'Cemitério Lajeado')
Sector.create(nome:'Cemitério Lapa')
Sector.create(nome:'Cemitério Parelheiros')
Sector.create(nome:'Cemitério Penha')
Sector.create(nome:'Cemitério Quarta Parada')
Sector.create(nome:'Cemitério Santana')
Sector.create(nome:'Cemitério Santo Amaro')
Sector.create(nome:'Cemitério São Luiz')
Sector.create(nome:'Cemitério São Paulo')
Sector.create(nome:'Cemitério São Pedro')
Sector.create(nome:'Cemitério Saudade')
Sector.create(nome:'Cemitério Tremembé')
Sector.create(nome:'Cemitério Vila Formosa I')
Sector.create(nome:'Cemitério Vila Formosa II')
Sector.create(nome:'Cemitério Vila Mariana')
Sector.create(nome:'Cemitério V.N. Cachoeirinha')
Sector.create(nome:'Crematório')
Sector.create(nome:'Licitação')
Sector.create(nome:'FM-2')
Sector.create(nome:'FM-3')
Sector.create(nome:'FM-33')
Sector.create(nome:'FM-3J')
Sector.create(nome:'Engenharia')
Sector.create(nome:'Protocolo')
Sector.create(nome:'Terrenos')
Sector.create(nome:'Folha de Pagamento')
Sector.create(nome:'DP')
Sector.create(nome:'RH')
Sector.create(nome:'Benefícios')
Sector.create(nome:'Ponto')
Sector.create(nome:'Contabilidade')
Sector.create(nome:'Tesouraria')
Sector.create(nome:'Jurídico')
Sector.create(nome:'Conteco')
Sector.create(nome:'Superintendencia')
Sector.create(nome:'Sindicância')
Sector.create(nome:'Social')