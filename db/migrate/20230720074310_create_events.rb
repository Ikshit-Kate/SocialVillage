class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :caption
      t.string :image

      t.timestamps
    end
  end
end
