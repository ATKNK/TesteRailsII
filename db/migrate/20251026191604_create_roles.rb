class CreateRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :roles do |t|
      t.string :title

      t.timestamps
    end
  end
end
