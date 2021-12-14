require 'rails_helper'

RSpec.describe 'Movies show page', type: :feature do
  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

    @movie1 = Movie.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: @universal.id)
    @movie2 = Movie.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy', studio_id: @universal.id)

    @movie1.actors.create!(name: 'Russell', age: 31)
    @movie1.actors.create!(name: 'Bob', age: 30)
  end
  it 'shows movie attributes' do
    visit "/movies/#{@movie1.id}"
    save_and_open_page
    expect(page).to have_content('Raiders of the Lost Ark')
    expect(page).to have_content('1981')
    expect(page).to have_content('Action/Adventure')
    expect(page).to have_content('30.5')
    expect('Bob').to appear_before('Russell')
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
