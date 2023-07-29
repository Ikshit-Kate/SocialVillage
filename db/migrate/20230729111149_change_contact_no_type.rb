# frozen_string_literal: true

class ChangeContactNoType < ActiveRecord::Migration[7.0]
  def change; 
    change_column :users, :contact_no, :bigint 
  end 
end
