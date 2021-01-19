class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  with_options presence: true do
    validates :product_name
    validates :text, length: { maximum: 1000 }
    validates :price, numericality:{ only_integer: true, with: /\A[0-9]+\z/, greater_than_or_equal_to:300,
                                     less_than_or_equal_to:9999999, message:"半角数字300以上9999999以下で入力して下さい" }
    validates :user
    validates :image
  end
  #「--」は保存したくないので、ジャンルの選択がid: 1)以外であれば保存できる
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :delivery_prefecture_id
    validates :delivery_date_id
  end


  has_one_attached :image
  has_one :record 
  belongs_to :user
  
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_prefecture
  belongs_to_active_hash :delivery_date
end
