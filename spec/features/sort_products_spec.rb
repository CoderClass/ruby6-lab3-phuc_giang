require 'rails_helper'

RSpec.feature "SortProducts", type: :feature do

  scenario "visit root path" do
    Product.create(name: "C", description: "A wonderful conical hat that forms a perfect right...", image_path: "non.jpg", price_vnd: 0.2e5, weight: 100)
    Product.create(name: "B", description: "A wonderful conical hat that forms a perfect right...", image_path: "non.jpg", price_vnd: 0.2e5, weight: 100)
    Product.create(name: "A", description: "A wonderful conical hat that forms a perfect right...", image_path: "non.jpg", price_vnd: 0.2e5, weight: 100)

    visit root_path
    expect(page.all(:css, ".product-name a").map(&:text)).to eq ['C', 'B', 'A']

    click_link "Sort by Alphabetical"
    expect(page.all(:css, ".product-name a").map(&:text)).to eq ['A', 'B', 'C']

  end

end
