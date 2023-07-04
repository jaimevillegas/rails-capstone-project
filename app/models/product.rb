class Product < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :category_product, dependent: :destroy
  has_many :category, through: :category_product

  validates_presence_of :name, :amount
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :user_id, presence: true
end
