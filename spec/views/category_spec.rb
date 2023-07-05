require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'User1', email: 'user1@test.com', password: 'test123')
    @category1 = Category.create(name: 'Category1', icon: 'icon1', user: @user1)
    @category2 = Category.create(name: 'Category2', icon: 'icon2', user: @user1)
    @product1 = Product.create(name: 'Product1', amount: 100, user: @user1)
    @product2 = Product.create(name: 'Product2', amount: 200, user: @user1)
    @product1.category << @category1
    @product2.category << @category1

    visit '/users/sign_in'
    fill_in 'Email', with: 'user1@test.com'
    fill_in 'Password', with: 'test123'
    click_button 'Log In'
  end

  it 'Can access the categories index page' do
    visit '/category'
    expect(page).to have_content('CATEGORIES')
  end

  it 'Can create a new category' do
    visit '/category'
    click_link 'Add Category'
    expect(page).to have_content('Create New Category')
  end

  it 'List all categories' do
    visit '/category'
    expect(page).to have_content('Category1')
    expect(page).to have_content('Category2')
  end

  it 'Can log out' do
    visit '/category'
    click_button 'Sign out'
    expect(page).to have_content('LOG IN')
  end
end
