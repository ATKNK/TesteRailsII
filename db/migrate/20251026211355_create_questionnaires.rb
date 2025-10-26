class CreateQuestionnaires < ActiveRecord::Migration[8.1]
  def change
    create_table :questionnaires do |t|
      t.string :code
      t.string :title
      t.string :description
      t.integer :duration_minutes
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
