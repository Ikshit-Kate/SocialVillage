# frozen_string_literal: true

class ChangePriceScaleInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :business_products, :price, :decimal, precision: 10, scale: 2
  end
end
