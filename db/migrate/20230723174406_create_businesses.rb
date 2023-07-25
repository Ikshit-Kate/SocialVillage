class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :email
      t.integer :contact_number
      t.string :address
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
