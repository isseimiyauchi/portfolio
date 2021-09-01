class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :from
      t.text :detail

      t.timestamps
    end
  end
end
