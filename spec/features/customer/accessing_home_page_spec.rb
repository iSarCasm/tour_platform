require 'rails_helper'

describe "Accessing Home Page", :type => :feature do
  it "loads home page" do
    visit '/'
    expect(page).to have_content 'Tour Platform'
  end
end
