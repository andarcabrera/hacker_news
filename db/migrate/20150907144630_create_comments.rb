class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :commenter_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
