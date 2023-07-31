# frozen_string_literal: true

class AddOwnerNameToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :owner_username, :string
  end
end
