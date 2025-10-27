class CreateUserAnswerHistories < ActiveRecord::Migration[8.1]
  def change
    create_table :user_answer_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :questionnaires, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :question_option, null: false, foreign_key: true
      t.boolean :is_correct
      t.timestamp :answered_at
      t.text :question_snapshot
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
