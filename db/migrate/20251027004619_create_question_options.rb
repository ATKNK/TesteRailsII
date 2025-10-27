class CreateQuestionOptions < ActiveRecord::Migration[8.1]
  def change
    create_table :question_options do |t|
      t.string :title
      t.boolean :is_correct
      t.belongs_to :question, null: false, foreign_key: true
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
