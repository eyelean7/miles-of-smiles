require 'rails_helper'

describe "the edit a review process" do
  it "edits a review" do
    package = Package.create(:name => 'Real Photos', :description => "So many photos, all the time.", :price => 199.99)
    review = Review.create(:content => 'Super good.', :package_id => package.id)
    visit package_path(package)
    click_on 'Edit'
    fill_in 'Description', :with => 'I just love it.'
    click_on 'Update Review'
    expect(page).to have_content 'I just love it.'
  end

  it "gives error when no description is entered" do
    package = Package.create(:name => 'Real Photos')
    review = Review.create(:description => 'I just love it.', :package_id => package.id)
    visit package_path(package)
    click_on 'Edit'
    fill_in 'Description', :with => ''
    click_button 'Update Review'
    expect(page).to have_content 'errors'
  end
end
