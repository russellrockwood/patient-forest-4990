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

  # it 'has link to hostels index' do
  #   visit '/cities'
  #
  #   expect(page).to have_link('Hostels', :href=>'/hostels')
  # end
  #
  # it 'has link to add new city' do
  #   visit '/cities'
  #
  #   expect(page).to have_link('New City', :href=>'/cities/new')
  # end
  #
  # it 'has link to update city' do
  #   visit '/cities'
  #
  #   expect(page).to have_link('Update', :href=>"/cities/#{@city1.id}/edit")
  # end
  #
  # it 'deletes city' do
  #   visit '/cities'
  #   click_button("delete", :match => :first)
  #
  #   expect(page).to have_no_content('Cityborro')
  # end
end
