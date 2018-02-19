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

ActiveRecord::Schema.define(version: 20180219115015) do

  create_table "actors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 100, default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "actors_movies", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "movie_id", null: false
    t.integer "actor_id", null: false
    t.index ["movie_id", "actor_id"], name: "index_actors_movies_on_movie_id_and_actor_id", unique: true, using: :btree
  end

  create_table "distributors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 100, default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "distributors_movies", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "movie_id",       null: false
    t.integer "distributor_id", null: false
    t.index ["movie_id", "distributor_id"], name: "index_distributors_movies_on_movie_id_and_distributor_id", using: :btree
  end

  create_table "movies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",        limit: 100, default: "", null: false
    t.integer  "release_year",             default: 0,  null: false
    t.string   "writter",      limit: 100, default: "", null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "director",     limit: 100, default: "", null: false
  end

  create_table "movies_production_companies", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "movie_id",              null: false
    t.integer "production_company_id", null: false
  end

  create_table "production_companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 100, default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "shooting_locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "address"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.text     "fun_facts",  limit: 65535
    t.integer  "movie_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "country",    limit: 100,   default: "", null: false
    t.string   "city",       limit: 100,   default: "", null: false
    t.index ["movie_id"], name: "index_shooting_locations_on_movie_id", using: :btree
  end

  add_foreign_key "shooting_locations", "movies"
end
