# frozen_string_literal: true

class CreateLocalAuthorities < ActiveRecord::Migration[7.0]
  def change
    create_table :local_authorities do |t|
      t.string :department
      t.string :name
      t.integer :contact_number
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
