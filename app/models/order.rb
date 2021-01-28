class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :product_name, :text, :price, :postcode, :prefecture_id, :city, :bloc, :building, :phone, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode,        format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id,   numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :bloc
    validates :phone, numericality: { only_integer: true, message: 'は半角数字で入力してください' }
    validates :token
  end
  validates :phone, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Exclude hyphen(-),Twelve or more' }

  def save
    # 各テーブルにデータを保存する処理を書く
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, bloc: bloc, building: building, phone: phone,
                   record_id: record.id)
  end
end
