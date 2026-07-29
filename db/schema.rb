# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_07_29_190910) do
  create_table "atendimentos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "data_hora", null: false
    t.integer "duracao", null: false
    t.text "observacoes"
    t.integer "paciente_id", null: false
    t.integer "prestador_id", null: false
    t.integer "status", default: 0, null: false
    t.string "tipo_atendimento", null: false
    t.datetime "updated_at", null: false
    t.index ["data_hora"], name: "index_atendimentos_on_data_hora"
    t.index ["paciente_id"], name: "index_atendimentos_on_paciente_id"
    t.index ["prestador_id"], name: "index_atendimentos_on_prestador_id"
    t.index ["status"], name: "index_atendimentos_on_status"
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "cpf", null: false
    t.datetime "created_at", null: false
    t.date "data_nascimento"
    t.string "email"
    t.text "endereco"
    t.string "nome_completo", null: false
    t.string "telefone"
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_pacientes_on_cpf", unique: true
  end

  create_table "prestadors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "especialidade"
    t.string "nome_completo", null: false
    t.string "registro_profissional", null: false
    t.integer "status", default: 0, null: false
    t.string "telefone"
    t.datetime "updated_at", null: false
    t.index ["registro_profissional"], name: "index_prestadors_on_registro_profissional", unique: true
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "name"
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "atendimentos", "pacientes"
  add_foreign_key "atendimentos", "prestadors"
  add_foreign_key "sessions", "users"
end
