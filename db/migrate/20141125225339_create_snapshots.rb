
class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.timestamps
      t.integer :picture_id, null: false, index: true
      t.integer :cell_size, null: false

      t.integer :original_png_width, null: false
      t.integer :original_png_height, null: false

      t.string :original_png_blob, null: false
      t.string :thumbnail_png_blob, null: false
      t.string :display_png_blob, null: false
    end
  end
end
