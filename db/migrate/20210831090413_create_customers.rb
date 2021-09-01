class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.text :address
      t.string :number
      t.text :assets
      t.text :memo
      t.boolean :right
      t.float :longitude
      t.float :latitude


      t.timestamps
    end
  end
end
