class ChangeContactType < ActiveRecord::Migration[7.0]
  def change
    change_column :businesses, :contact_number, :bigint
  end
end
