# frozen_string_literal: true

class AddBusinessNameToBusinessProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :business_products, :business_name, :string
  end
end
