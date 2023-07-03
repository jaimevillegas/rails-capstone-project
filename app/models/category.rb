class Category < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :category_product
  has_many :product, through: :category_product

  validates_presence_of :user
  validates :name, presence: true
  validates :icon, presence: true
end
