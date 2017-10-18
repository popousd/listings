class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.timestamps
      t.string :title
      t.text :description
      t.string :picture
    end
  end
end
