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

ActiveRecord::Schema[8.1].define(version: 2025_10_27_034210) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "question_options", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "is_correct"
    t.bigint "question_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_options_on_question_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "description"
    t.integer "duration_minutes"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "enunciation"
    t.bigint "questionnaire_id", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
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

  create_table "user_answer_histories", force: :cascade do |t|
    t.datetime "answered_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.boolean "is_correct"
    t.bigint "question_id", null: false
    t.bigint "question_option_id", null: false
    t.text "question_snapshot"
    t.bigint "questionnaires_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["question_id"], name: "index_user_answer_histories_on_question_id"
    t.index ["question_option_id"], name: "index_user_answer_histories_on_question_option_id"
    t.index ["questionnaires_id"], name: "index_user_answer_histories_on_questionnaires_id"
    t.index ["user_id"], name: "index_user_answer_histories_on_user_id"
  end

  create_table "user_results", force: :cascade do |t|
    t.integer "correct_answers"
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.bigint "questionnaires_id", null: false
    t.decimal "score"
    t.datetime "submitted_at", precision: nil
    t.integer "total_questions"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["questionnaires_id"], name: "index_user_results_on_questionnaires_id"
    t.index ["user_id"], name: "index_user_results_on_user_id"
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

  add_foreign_key "question_options", "questions"
  add_foreign_key "questions", "questionnaires"
  add_foreign_key "user_answer_histories", "question_options"
  add_foreign_key "user_answer_histories", "questionnaires", column: "questionnaires_id"
  add_foreign_key "user_answer_histories", "questions"
  add_foreign_key "user_answer_histories", "users"
  add_foreign_key "user_results", "questionnaires", column: "questionnaires_id"
  add_foreign_key "user_results", "users"
end
