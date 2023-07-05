class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :category
  has_many :product, foreign_key: :author_id

  validates :name, presence: true
end
