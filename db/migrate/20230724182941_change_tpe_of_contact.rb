class ChangeTpeOfContact < ActiveRecord::Migration[7.0]
  def change
    change_column :local_authorities, :contact_number, :bigint
  end
end
