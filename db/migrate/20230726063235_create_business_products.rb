# frozen_string_literal: true

class CreateBusinessProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :business_products do |t|
      t.string :name
      t.string :brand
      t.decimal :price
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
