class CreateStudios < ActiveRecord::Migration[6.0]
  def change
    create_table :studios do |t|
      t.string :address
      t.string :title
      t.text :description
      t.string :photos
      t.integer :price
      t.integer :capacity

      t.timestamps
    end
  end
end
