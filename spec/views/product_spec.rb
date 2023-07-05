require 'rails_helper'

RSpec.describe 'Products', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'User1', email: 'user1@test.com', password: 'test123')
    @category1 = Category.create(name: 'Category1', icon: 'icon1', user: @user1)
    @product1 = Product.create(name: 'Product1', amount: 100, user: @user1)
    @category_product1 = CategoryProduct.create(category: @category1, product: @product1)

    visit '/users/sign_in'
    fill_in 'Email', with: 'user1@test.com'
    fill_in 'Password', with: 'test123'
    click_button 'Log In'
  end

  it 'Can access the products index page' do
    visit "/category/#{@category1.id}/product"
    expect(page).to have_content('TRANSACTIONS')
  end

  it 'Show product' do
    visit "/category/#{@category1.id}/product"
    expect(page).to have_content('Product1')
  end

  it 'Show product amount' do
    visit "/category/#{@category1.id}/product"
    expect(page).to have_content('100')
  end

  it 'Can create a new transaction' do
    visit "/category/#{@category1.id}/product"
    click_link 'New Transaction'
    expect(page).to have_content('Create New Transaction')
  end
end
