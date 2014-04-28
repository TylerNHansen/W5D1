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

ActiveRecord::Schema.define(version: 20140428215529) do

  create_table "circle_user_memberships", force: true do |t|
    t.integer "circle_id"
    t.integer "user_id"
  end

  add_index "circle_user_memberships", ["circle_id"], name: "index_circle_user_memberships_on_circle_id"
  add_index "circle_user_memberships", ["user_id"], name: "index_circle_user_memberships_on_user_id"

  create_table "circles", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "circles", ["user_id"], name: "index_circles_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["password_digest"], name: "index_users_on_password_digest"
  add_index "users", ["token"], name: "index_users_on_token", unique: true

end
