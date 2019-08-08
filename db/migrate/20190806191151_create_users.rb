class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image
      t.string :uid
      t.string :password_digest
      t.integer :pet_count

      t.timestamps
    end
  end
end
