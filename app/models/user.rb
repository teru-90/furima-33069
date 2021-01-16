class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #   - 以下の項目に関しては、モデルで新たにバリデーションを実装する必要はない
  # （Deviseにデフォルトでバリデーションが備わっているため）。
  # しかし、単体テストコードを書き、バリデーションが働いているかの検証は必要。
  # メールアドレスが必須であること
  # メールアドレスは、@を含む必要があること
  # パスワードが必須であること
  # パスワードは、6文字以上での入力が必須であること
  # パスワードとパスワード（確認用）、値の一致が必須であること
  # validates :カラム名, format: { with: 正規表現 }
  validates :nickname, presence: true
  validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数混合を使用してください' }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'カナを使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true

  has_many :items
  has_many :records
end
