class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee_payment
  belongs_to :prefecture
  belongs_to :shipping_day

  has_one_attached :image

  validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters" }

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_fee_payment_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price, inclusion: { in: 300..9_999_999, message: "is out of setting range" }
  end


  
  with_options numericality: {other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_payment_id
    validates :prefecture_id
    validates :shipping_day_id
  end

end
