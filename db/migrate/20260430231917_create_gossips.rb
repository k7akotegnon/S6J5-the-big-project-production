class CreateGossips < ActiveRecord::Migration[8.1]
  def change
    create_table :gossips do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
