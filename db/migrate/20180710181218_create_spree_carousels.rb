class CreateSpreeCarousels < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_carousels do |t|
      t.string :group
      t.string :title
      t.text :description
      t.timestamp :available_from
      t.timestamp :available_until
      t.integer :active_days
      t.timestamps
    end
  end
end
