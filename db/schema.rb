# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_11_133015) do

  create_table "hotspots", force: :cascade do |t|
    t.string "theme"
    t.string "stuid"
    t.string "content"
    t.integer "hotpot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "signins", force: :cascade do |t|
    t.string "stuid"
    t.string "password_digest"
    t.string "authority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "task_and_users", force: :cascade do |t|
    t.integer "task_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ispassed"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "theme"
    t.string "stuid"
    t.text "content"
    t.integer "hotpot"
    t.integer "applicant"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.text "abstract"
    t.integer "totalnum"
    t.index ["user_id", "created_at"], name: "index_tasks_on_user_id_and_created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "stuid"
    t.string "name"
    t.integer "age"
    t.string "school"
    t.string "currterm"
    t.string "email"
    t.string "tel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "remember_digest"
  end

end
