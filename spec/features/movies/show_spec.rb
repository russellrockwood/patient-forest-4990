require 'rails_helper'

RSpec.describe 'Movies show page', type: :feature do
  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

    @movie1 = Movie.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: @universal.id)
    @movie2 = Movie.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy', studio_id: @universal.id)

    # @movie1.actors.new(name: 'Russell', age: 31)
    # @movie1.actor.new(name: 'Bob', age: 30)
    # Actor.create!(name: 'Sunny', age: 32)
  end

  it 'shows movie attributes' do
    visit "/movies/#{@movie1.id}"

    expect(page).to have_content('Raiders of the Lost Ark')
    expect(page).to have_content('1981')
    expect(page).to have_content('Action/Adventure')
    expect(page).to have_content('30.5')
    expect('Bob').to appear_before('Russell')
  end

  it "adds actor to movie" do
    # binding.pry
    # save_and_open_page
    visit "/movies/#{@movie1.id}"

    fill_in 'name', with: 'Sunny'
    click_on 'Submit'
    expect(page).to have_content('Sunny')
  end

end
