class CreateSpreeCarousels < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_carousels do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
