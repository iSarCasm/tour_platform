require 'rails_helper'

describe "Ordering new Tour", :type => :feature do
  before do
    tour = create :tour, title: 'UK Super Tour', description: 'Great Tour description'
    create(:active_tour,
      tour: tour,
      start_date: Date.new(2017, 7, 14),
      end_date: Date.new(2017, 7, 28)
    )
  end

  it "can order a new tour" do
    visit '/'
    expect(page).to have_content 'UK Super Tour'
    click_link 'Start The Adventure'

    expect(page).to have_content 'UK Super Tour'
    expect(page).to have_content 'Great Tour description'
    expect(page).to have_content 'Book your tour now!'
    expect(page).to have_content 'UK Super Tour 14 July - 28 July'
    click_link 'UK Super Tour 14 July - 28 July'

    expect(page).to have_content 'Booking your tour'
  end
end
