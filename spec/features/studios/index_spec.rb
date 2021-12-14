require 'rails_helper'

RSpec.describe 'Studios index page', type: :feature do
  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

    @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
  end
  it 'can see all cities and dates added' do
    visit '/studios'

    expect(page).to have_content(@universal.name)
    expect(page).to have_content(@universal.location)
    expect(page).to have_content('Raiders of the Lost Ark',)
    expect(page).to have_content('Shrek')
  end
end
