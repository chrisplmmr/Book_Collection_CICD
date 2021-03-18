require 'rails_helper'
require 'date'

# Creating a Book Acceptance Test
RSpec.describe "Book Creation Acceptance", type: :feature do

    scenario "creating a new book by accpetance criteria" do
        visit root_path
        click_on '+ Add New Book +'
        fill_in 'Title', with: 'Ruby on Rails for Dummies'
        fill_in 'Author', with: 'Me'
        select "Sci-Fi", from: "Genre", :match => :first
        fill_in 'Price', with: '19.89'
        # published date auto selected
        click_button 'Create Book'
        expect(page).to have_content('Home Page')
        expect(page).to have_content('Ruby on Rails for Dummies')
        expect(page).to have_content('Me')
        expect(page).to have_content('Sci-Fi')
        expect(page).to have_content('19.89')
        expect(page).to have_content('Notice: Book Created Successfully')
    end
end