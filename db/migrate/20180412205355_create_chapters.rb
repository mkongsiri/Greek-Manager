class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.string :type
      t.string :name
      t.string :chapter_name

      t.timestamps
    end
  end
end
