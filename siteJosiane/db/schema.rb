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

ActiveRecord::Schema.define(version: 20140910184102) do

  create_table "alunos", force: true do |t|
    t.string   "nome",       limit: 100
    t.string   "matricula",  limit: 8
    t.string   "senha",      limit: 30
    t.string   "email",      limit: 250
    t.boolean  "confirmado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professores", force: true do |t|
    t.string   "nome",       limit: 100
    t.string   "email",      limit: 250
    t.string   "senha",      limit: 30
    t.string   "siape",      limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
