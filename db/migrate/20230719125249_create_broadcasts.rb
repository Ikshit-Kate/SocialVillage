class CreateBroadcasts < ActiveRecord::Migration[7.0]
  def change
    create_table :broadcasts do |t|
      t.string :heading
      t.string :body

      t.timestamps
    end
  end
end
