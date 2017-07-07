require 'rails_helper'

describe "the add a package process" do
  it "adds a new package" do
    visit packages_path
    click_link 'New Package'
    fill_in 'Name', :with => 'Real Photos'
    fill_in 'Description', :with => 'So many photos, all the time.'
    click_on 'Create Package'
    expect(page).to have_content 'Real Photos'
  end

  it "gives error when no name or description is entered" do
    visit new_package_path
    click_on 'Create Package'
    expect(page).to have_content 'errors'
  end
end
