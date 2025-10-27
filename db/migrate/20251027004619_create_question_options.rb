class CreateQuestionOptions < ActiveRecord::Migration[8.1]
  def change
    create_table :question_options do |t|
      t.string :title
      t.boolean :is_correct
      t.belongs_to :questions, null: false, foreign_key: true

      t.timestamps
    end
  end
end
