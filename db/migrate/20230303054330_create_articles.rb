class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user                    , null: false, foreign_key: true
      t.string     :name                    , null: false
      t.text       :description             , null: false
      t.integer    :category_id             , null: false
      t.integer    :condition_id            , null: false
      t.integer    :delivery_fee_payment_id , null: false
      t.integer    :prefecture_id           , null: false
      t.integer    :shipping_day_id         , null: false
      t.integer    :price                   , null: false
      t.timestamps
    end
  end
end
