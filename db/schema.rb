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

ActiveRecord::Schema.define(version: 20150818232517) do

  create_table "categorias", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "nome"
  end

  create_table "chamados", force: :cascade do |t|
    t.string   "canal_contato"
    t.string   "categoria"
    t.integer  "user_id"
    t.integer  "objeto_id"
    t.integer  "solicitante_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "descricao"
    t.text     "observacoes"
    t.string   "status",         default: "E"
    t.boolean  "resolvido",      default: false
    t.text     "resolucao"
    t.string   "prioridade"
  end

  add_index "chamados", ["objeto_id"], name: "index_chamados_on_objeto_id"
  add_index "chamados", ["solicitante_id"], name: "index_chamados_on_solicitante_id"
  add_index "chamados", ["user_id"], name: "index_chamados_on_user_id"

  create_table "chamuserships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chamado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chamuserships", ["chamado_id"], name: "index_chamuserships_on_chamado_id"
  add_index "chamuserships", ["user_id"], name: "index_chamuserships_on_user_id"

  create_table "objetos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "categoria_id"
  end

  add_index "objetos", ["categoria_id"], name: "index_objetos_on_categoria_id"
  add_index "objetos", ["nome"], name: "index_objetos_on_nome", unique: true

  create_table "objsecships", force: :cascade do |t|
    t.integer  "objeto_id"
    t.integer  "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["rf"], name: "index_users_on_rf", unique: true

end
