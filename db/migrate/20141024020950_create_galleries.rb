class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.timestamps
      t.integer :user_id, index: true
    end
  end
end
