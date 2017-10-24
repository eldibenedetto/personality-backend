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

ActiveRecord::Schema.define(version: 20171019183213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "insights", force: :cascade do |t|
    t.text "writing_sample"
    t.text "insightJSON"
    t.integer "openness"
    t.integer "agreeableness"
    t.integer "conscientiousness"
    t.integer "introversion_extraversion"
    t.integer "emotional_range"
    t.string "insightable_type"
    t.bigint "insightable_id"
    t.index ["insightable_type", "insightable_id"], name: "index_insights_on_insightable_type_and_insightable_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
  end

  create_table "user_people", force: :cascade do |t|
    t.integer "user_id"
    t.integer "person_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "gender"
    t.string "username"
    t.string "password_digest"
  end

end
