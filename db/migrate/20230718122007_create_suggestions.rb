# frozen_string_literal: true

class CreateSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :suggestions do |t|
      t.string :suggestion_body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
