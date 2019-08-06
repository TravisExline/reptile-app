class CreateReptiles < ActiveRecord::Migration[5.1]
  def change
    create_table :reptiles do |t|
      t.string :name
      t.string :species
      t.integer :age
      t.integer :offspring
      t.integer :user_id

      t.timestamps
    end
  end
end
