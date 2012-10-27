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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121023013839) do

  create_table "encuesta", :force => true do |t|
    t.string   "nombre"
    t.integer  "maestrium_id"
    t.boolean  "habilitada"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "encuesta", ["maestrium_id"], :name => "index_encuesta_on_maestrium_id"

  create_table "encuesta_materia", :force => true do |t|
    t.integer "encuestum_id"
    t.integer "materium_id"
  end

  add_index "encuesta_materia", ["encuestum_id"], :name => "index_encuesta_materia_on_encuestum_id"
  add_index "encuesta_materia", ["materium_id"], :name => "index_encuesta_materia_on_materium_id"

  create_table "estudiante_pensums", :force => true do |t|
    t.integer  "estudiante_id"
    t.integer  "pensum_id"
    t.string   "estado"
    t.string   "carpeta"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "estudiante_pensums", ["estudiante_id"], :name => "index_estudiante_pensums_on_estudiante_id"
  add_index "estudiante_pensums", ["pensum_id"], :name => "index_estudiante_pensums_on_pensum_id"

  create_table "estudiante_seccions", :force => true do |t|
    t.integer  "estudiante_id"
    t.integer  "seccion_id"
    t.string   "estado"
    t.string   "periodo"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "estudiante_seccions", ["estudiante_id"], :name => "index_estudiante_seccions_on_estudiante_id"
  add_index "estudiante_seccions", ["seccion_id"], :name => "index_estudiante_seccions_on_seccion_id"

  create_table "estudiantemateria", :force => true do |t|
    t.string   "estado"
    t.integer  "estudiante_id"
    t.integer  "materium_id"
    t.integer  "tipo_pensum_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "estudiantemateria", ["estudiante_id"], :name => "index_estudiantemateria_on_estudiante_id"
  add_index "estudiantemateria", ["materium_id"], :name => "index_estudiantemateria_on_materium_id"
  add_index "estudiantemateria", ["tipo_pensum_id"], :name => "index_estudiantemateria_on_tipo_pensum_id"

  create_table "estudiantes", :force => true do |t|
    t.integer  "user_id"
    t.string   "foto"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "tipo_estudiante"
    t.string   "documento"
    t.string   "tipo_documento"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "estudiantes", ["user_id"], :name => "index_estudiantes_on_user_id"

  create_table "homologacions", :force => true do |t|
    t.string   "materiaorigen"
    t.integer  "materia_id"
    t.boolean  "estado"
    t.integer  "estudiante_id"
    t.string   "observaciones"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "homologacions", ["estudiante_id"], :name => "index_homologacions_on_estudiante_id"
  add_index "homologacions", ["materia_id"], :name => "index_homologacions_on_materia_id"

  create_table "horarios", :force => true do |t|
    t.integer  "seccion_id"
    t.string   "dia"
    t.time     "hora_inicio"
    t.time     "hora_fin"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "horarios", ["seccion_id"], :name => "index_horarios_on_seccion_id"

  create_table "maestria", :force => true do |t|
    t.integer  "user_id"
    t.string   "nombre"
    t.string   "codigo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "maestria", ["user_id"], :name => "index_maestria_on_user_id"

  create_table "materia", :force => true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "maestrium_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "materia_pensums", :force => true do |t|
    t.integer  "pensum_id"
    t.integer  "materium_id"
    t.text     "descripcion"
    t.integer  "cantidad"
    t.integer  "semestre_sugerido"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "materia_pensums", ["materium_id"], :name => "index_materia_pensums_on_materium_id"
  add_index "materia_pensums", ["pensum_id"], :name => "index_materia_pensums_on_pensum_id"

  create_table "materia_tipo_pensums", :force => true do |t|
    t.integer  "materium_id"
    t.integer  "tipo_pensum_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "materia_tipo_pensums", ["materium_id"], :name => "index_materia_tipo_pensums_on_materium_id"
  add_index "materia_tipo_pensums", ["tipo_pensum_id"], :name => "index_materia_tipo_pensums_on_tipo_pensum_id"

  create_table "pensums", :force => true do |t|
    t.date     "fechacreacion"
    t.string   "nombre"
    t.boolean  "estado"
    t.integer  "maestrium_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "pensums", ["maestrium_id"], :name => "index_pensums_on_maestrium_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "seccions", :force => true do |t|
    t.integer  "materium_id"
    t.string   "etiqueta"
    t.string   "profesor"
    t.string   "salon"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "seccions", ["materium_id"], :name => "index_seccions_on_materium_id"

  create_table "tipo_pensums", :force => true do |t|
    t.integer  "pensum_id"
    t.string   "descripcion"
    t.integer  "cantidad"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tipo_pensums", ["pensum_id"], :name => "index_tipo_pensums_on_pensum_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
