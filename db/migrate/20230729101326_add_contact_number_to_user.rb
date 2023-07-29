# frozen_string_literal: true

class AddContactNumberToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :contact_no, :integer
  end
end
