class CreateSpreeCarouselItems < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_carousel_items do |t|
      t.references :carousel
      t.string :link
      t.boolean :visible
      t.text :content
      t.integer :position
      t.timestamps
    end
  end
end
