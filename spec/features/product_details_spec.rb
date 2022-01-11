require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
      end
    end

    scenario "They see a product" do
      visit root_path
      expect(page).to have_css 'article.product', count: 1
    end

    scenario "The Details link should be visible" do
      visit root_path
      expect(page).to have_link("Details", visible: true)
    end

    scenario "Should be able to click on the Details link and show the product" do
      visit root_path
      click_on 'Details'
      expect(page).to have_css '.product-detail', count: 1
    end

    
end
