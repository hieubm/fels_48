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

ActiveRecord::Schema.define(version: 20150417080749) do

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "target_id",   limit: 4
    t.integer  "action_type", limit: 4
    t.string   "message",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "answer_sheets", force: :cascade do |t|
    t.integer  "lesson_id",  limit: 4,                 null: false
    t.integer  "word_id",    limit: 4,                 null: false
    t.integer  "answer_id",  limit: 4
    t.boolean  "correct",    limit: 1, default: false, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "answer_sheets", ["lesson_id"], name: "index_answer_sheets_on_lesson_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.integer  "word_id",    limit: 4,                   null: false
    t.string   "content",    limit: 255
    t.boolean  "correct",    limit: 1,   default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "answers", ["word_id"], name: "index_answers_on_word_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.string   "image",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "learned_words", force: :cascade do |t|
    t.integer  "user_id",     limit: 4, null: false
    t.integer  "category_id", limit: 4, null: false
    t.integer  "word_id",     limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "learned_words", ["user_id", "category_id"], name: "index_learned_words_on_user_id_and_category_id", using: :btree
  add_index "learned_words", ["user_id"], name: "index_learned_words_on_user_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,                 null: false
    t.integer  "category_id", limit: 4,                 null: false
    t.integer  "correct_num", limit: 4, default: 0,     null: false
    t.boolean  "finished",    limit: 1, default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "lessons", ["user_id"], name: "index_lessons_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4, null: false
    t.integer  "followed_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255, default: "",    null: false
    t.string   "email",           limit: 255,                 null: false
    t.string   "remember_digest", limit: 255
    t.string   "password_digest", limit: 255,                 null: false
    t.boolean  "admin",           limit: 1,   default: false, null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_digest"], name: "index_users_on_remember_digest", using: :btree

  create_table "words", force: :cascade do |t|
    t.integer  "category_id", limit: 4,   null: false
    t.string   "content",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "words", ["category_id"], name: "index_words_on_category_id", using: :btree

end
