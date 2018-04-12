class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :chapter, foreign_key: true
      t.string :type
      t.string :date
      t.string :name
      t.text :description
      t.text :notes

      t.timestamps
    end
  end
end
