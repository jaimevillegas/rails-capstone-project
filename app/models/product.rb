class Product < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_product
  has_many :category, through: :category_product

  validates_presence_of :name, :amount, :author
end
