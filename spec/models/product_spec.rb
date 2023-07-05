require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @user1 = User.create(name: 'User1', email: 'user1@test.com', password: 'test123')
    expect(@user1).to be_valid
    @product1 = Product.create(name: 'Product1', amount: 100, user: @user1)
  end

  it 'is valid with valid attributes' do
    expect(@product1).to be_valid
  end

  it 'is not valid without a name' do
    @product1.name = nil
    expect(@product1).to_not be_valid
  end

  it 'is not valid without an amount' do
    @product1.amount = nil
    expect(@product1).to_not be_valid
  end
end
