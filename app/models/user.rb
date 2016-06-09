class User < ApplicationRecord
  has_secure_token
  has_secure_password

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

end
