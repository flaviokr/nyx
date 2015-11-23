# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151021194315) do

  create_table "categorias", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "nome"
  end

  create_table "chamados", force: :cascade do |t|
    t.string   "canal_contato"
    t.integer  "user_id"
    t.integer  "objeto_id"
    t.integer  "solicitante_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "descricao"
    t.text     "observacoes"
    t.string   "status",         default: "A"
    t.string   "prioridade"
    t.integer  "resolucao_id"
    t.integer  "categoria_id"
    t.integer  "encarregado_id"
    t.datetime "abertura"
    t.boolean  "estourado",      default: false
  end

  add_index "chamados", ["categoria_id"], name: "index_chamados_on_categoria_id"
  add_index "chamados", ["encarregado_id"], name: "index_chamados_on_encarregado_id"
  add_index "chamados", ["objeto_id"], name: "index_chamados_on_objeto_id"
  add_index "chamados", ["resolucao_id"], name: "index_chamados_on_resolucao_id"
  add_index "chamados", ["solicitante_id"], name: "index_chamados_on_solicitante_id"
  add_index "chamados", ["user_id"], name: "index_chamados_on_user_id"

  create_table "objetos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "categoria_id"
  end

  add_index "objetos", ["categoria_id"], name: "index_objetos_on_categoria_id"

  create_table "registros", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "n_chamados",    default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "justificativa"
  end

  add_index "registros", ["user_id"], name: "index_registros_on_user_id"

  create_table "resolucoes", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "resolvido"
    t.boolean  "contato_externo"
    t.string   "empresa_contatada"
    t.string   "nome_atendente_empresa_contatada"
    t.boolean  "equipamento_trocado"
    t.text     "justificativa"
    t.integer  "chamado_id"
    t.datetime "encerramento"
  end

  add_index "resolucoes", ["chamado_id"], name: "index_resolucoes_on_chamado_id"

  create_table "sectors", force: :cascade do |t|
    t.string   "nome"
    t.string   "bairro"
    t.string   "rua"
    t.string   "numero"
    t.text     "complemento"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sectors", ["nome"], name: "index_sectors_on_nome", unique: true

  create_table "solicitantes", force: :cascade do |t|
    t.string   "rf"
    t.string   "nome"
    t.string   "email"
    t.string   "ramal"
    t.integer  "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "solicitantes", ["rf"], name: "index_solicitantes_on_rf", unique: true
  add_index "solicitantes", ["sector_id"], name: "index_solicitantes_on_sector_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "rf"
    t.string   "celular"
    t.string   "comunicador"
    t.boolean  "admin"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "logado",           default: false
    t.boolean  "precisa_deslogar", default: false
  end

  add_index "users", ["rf"], name: "index_users_on_rf", unique: true

end
