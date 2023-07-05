require 'rails_helper'

RSpec.describe CategoryProduct, type: :model do
  before(:each) do
    @user1 = User.create(name: 'User1', email: 'user1@test.com', password: 'test123')
    expect(@user1).to be_valid
    @category1 = Category.create(name: 'Category1', icon: 'icon1', user: @user1)
    @product1 = Product.create(name: 'Product1', amount: 100, user: @user1)
    @category_product1 = CategoryProduct.create(category: @category1, product: @product1)
  end

  it 'is valid with valid attributes' do
    expect(@category_product1).to be_valid
  end
end
