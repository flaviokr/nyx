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
User.create(rf:'1111111', name: 'Rodrigo',admin: false, password: '123456', email: 'rodrigo@email.com', celular: '0000', comunicador: '0000')
User.create(rf:'2222222', name: 'Vitor',admin: false, password: '123456', email: 'vitor@email.com', celular: '0000', comunicador: '0000')
User.create(rf:'3333333', name: 'Lucas',admin: false, password: '123456', email: 'lucas@email.com', celular: '0000', comunicador: '0000')
User.create(rf:'4444444', name: 'Arthur',admin: false, password: '123456', email: 'arthur@email.com', celular: '0000', comunicador: '0000')
User.create(rf:'5555555', name: 'Flavio',admin: false, password: '123456', email: 'flavio@email.com', celular: '0000', comunicador: '0000')

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


Solicitante.create(rf: "9999991", nome: "Joaquim", email: "joaquim@teste.com", 
ramal: "666", sector_id: 9, created_at: "2015-09-25 20:35:33", updated_at: "2015-09-25 20:35:33")
Solicitante.create(rf: "9999992", nome: "João", email: "joao@teste.com", 
ramal: "666", sector_id: 7, created_at: "2015-09-25 20:35:33", updated_at: "2015-09-25 20:35:33")
Solicitante.create(rf: "9999993", nome: "Maria Joaquina", email: "maria_joaquina@teste.com", 
ramal: "666", sector_id: 6, created_at: "2015-09-25 20:35:33", updated_at: "2015-09-25 20:35:33")
Solicitante.create(rf: "9999994", nome: "Fulano", email: "fulano@teste.com", 
ramal: "666", sector_id: 3, created_at: "2015-09-25 20:35:33", updated_at: "2015-09-25 20:35:33")


Chamado.create(canal_contato: "T", user_id: 1, objeto_id: 9, solicitante_id: 1, descricao: "Programa não abre", 
observacoes: "", status: "E", prioridade: "2", categoria_id: 2, encarregado_id: 1, abertura: "2015-09-25 20:34:00")

Chamado.create(canal_contato: "E", user_id: 1, objeto_id: 1, solicitante_id: 2, descricao: "Um meteoro atingiu o pc",
observacoes: "", status: "E", prioridade: "2", categoria_id: 1, encarregado_id: 1, abertura: "2015-09-25 20:35:00")

Chamado.create(canal_contato: "T", user_id: 1, objeto_id: 2, solicitante_id: 3, descricao: "O monitor não liga",
observacoes: "", status: "E", prioridade: "4", categoria_id: 1, encarregado_id: 2, abertura: "2015-09-25 20:30:00")

Chamado.create(canal_contato: "E", user_id: 1, objeto_id: 8, solicitante_id: 1, descricao: "Pegando Fogo", 
observacoes: "", status: "E", prioridade: "3", categoria_id: 1, encarregado_id: 2, abertura: "2015-09-25 20:25:00")

Chamado.create(canal_contato: "P", user_id: 1, objeto_id: 9, solicitante_id: 4, descricao: "Não consegue abrir o assistente do office", 
observacoes: "", status: "A", prioridade: "1", categoria_id: 2, encarregado_id: 2, abertura: "2015-09-25 20:37:00")
 
Chamado.create(canal_contato: "P", user_id: 1, objeto_id: 4, solicitante_id: 1, descricao: "Computador explodiu", 
observacoes: "", status: "A", prioridade: "2", categoria_id: 2, encarregado_id: 3, abertura: "2015-09-25 20:37:00")

Chamado.create(canal_contato: "P", user_id: 1, objeto_id: 2, solicitante_id: 2, descricao: "Não acessa a rede", 
observacoes: "", status: "A", prioridade: "3", categoria_id: 3, encarregado_id: 3, abertura: "2015-09-25 20:37:00")

Chamado.create(canal_contato: "T", user_id: 1, objeto_id: 1, solicitante_id: 2, descricao: "Rede caiu", 
observacoes: "", status: "A", prioridade: "4", categoria_id: 3, encarregado_id: 4, abertura: "2015-09-25 20:37:00")

Chamado.create(canal_contato: "E", user_id: 1, objeto_id: 2, solicitante_id: 3, descricao: "Falha no banco de dados", 
observacoes: "", status: "A", prioridade: "2", categoria_id: 2, encarregado_id: 4, abertura: "2015-09-25 20:37:00")

Chamado.create(canal_contato: "E", user_id: 1, objeto_id: 4, solicitante_id: 4, descricao: "Não acessa a internet", 
observacoes: "", status: "A", prioridade: "1", categoria_id: 2, encarregado_id: 5, abertura: "2015-09-25 20:37:00")

Chamado.create(canal_contato: "E", user_id: 1, objeto_id: 4, solicitante_id: 3, descricao: "Falta de cabo de força", 
observacoes: "", status: "A", prioridade: "3", categoria_id: 1, encarregado_id: 5, abertura: "2015-09-25 20:37:00")

Chamado.create(canal_contato: "P", user_id: 1, objeto_id: 3, solicitante_id: 3, descricao: "Teste 1", 
observacoes: "", status: "A", prioridade: "2", categoria_id: 1, encarregado_id: 5, abertura: "2015-09-25 20:37:00")

Chamado.create(canal_contato: "T", user_id: 1, objeto_id: 3, solicitante_id: 1, descricao: "Teste 2", 
observacoes: "", status: "A", prioridade: "4", categoria_id: 2, encarregado_id: 3, abertura: "2015-09-25 20:37:00")

Chamado.create(canal_contato: "T", user_id: 1, objeto_id: 3, solicitante_id: 2, descricao: "Teste 3", 
observacoes: "", status: "A", prioridade: "1", categoria_id: 3, encarregado_id: 4, abertura: "2015-09-25 20:37:00")