class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,                 null: false
      t.text :text,                           null: false
      t.integer :price,                       null: false
      t.references :user,                     null: false, foreign_key: true
      t.integer :category_id,                 null: false
      t.integer :state_id,                    null: false
      t.integer :delivery_fee_id,             null: false
      t.integer :delivery_prefecture_id,      null: false
      t.integer :delivery_date_id,            null: false
      t.timestamps
    end
  end
end
