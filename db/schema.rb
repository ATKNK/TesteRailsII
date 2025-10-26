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

ActiveRecord::Schema[8.1].define(version: 2025_10_26_211355) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "questionnaires", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "description"
    t.integer "duration_minutes"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_roles_on_deleted_at"
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "user_id", null: false
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id"
    t.index ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "email"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
  end
end
