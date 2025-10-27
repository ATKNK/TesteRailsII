class CreateQuestions < ActiveRecord::Migration[8.1]
  def change
    create_table :questions do |t|
      t.string :enunciation
      t.datetime :deleted_at
      t.belongs_to :questionnaire, null: false, foreign_key: true

      t.timestamps
    end
  end
end
