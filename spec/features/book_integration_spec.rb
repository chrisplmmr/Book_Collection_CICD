require 'rails_helper'
require 'date'

# Creating a book integration test (valid input and invalid input)
RSpec.describe "Book Creation", type: :feature do

    # Valid Input
    scenario "adding a new book with valid fields" do
        visit root_path
        click_on '+ Add New Book +'
        expect(page).to have_content('Book Creation')
        fill_in 'Title', with: 'Captain Underpants'
        fill_in 'Author', with: 'Johnson'
        select "Fiction", from: "Genre", :match => :first
        fill_in 'Price', with: '19.99'
        # date auto selected
        click_button 'Create Book'
        expect(page).to have_content('Home Page')
        expect(page).to have_content('Captain Underpants')
        expect(page).to have_content('Notice: Book Created Successfully')
    end

    # Invalid Input
    scenario "adding a new book with invalid fields" do
        visit root_path
        click_on '+ Add New Book +'
        expect(page).to have_content('Book Creation')
        fill_in 'Title', with: '' # Invalid
        fill_in 'Author', with: 'Johnson'
        select "Fiction", from: "Genre", :match => :first
        fill_in 'Price', with: '19.99'
        # date auto selected
        click_button 'Create Book'
        expect(page).to have_content('Notice: Title Cannot Be Blank')
    end
end

# Showing a book integration test
RSpec.describe "Book Show", type: :feature do
    scenario "visiting a books information" do
        date = DateTime.now.strftime('%a, %d %b %Y %H:%M:%S')
        mybook = Book.create!(title: 'New Book', author: 'Me', genre: 'Fiction', price: '10.99', published_date: date)
        visit book_path(id: mybook.id)
        expect(page).to have_content('New Book')
        expect(page).to have_content('Me')
        expect(page).to have_content('Fiction')
        expect(page).to have_content('10.99')
    end
end

# Updating a book integration test
RSpec.describe "Book Update", type: :feature do
    scenario "completing an update of a book" do
        date = DateTime.now.strftime('%a, %d %b %Y %H:%M:%S')
        mybook = Book.create!(title: 'New Book', author: 'Me', genre: 'Fiction', price: '10.99', published_date: date)
        visit edit_book_path(id: mybook.id)
        fill_in 'Title', with: 'New Title'
        click_button 'Edit Book'
        visit root_path
        expect(page).to have_content('New Title')
    end
end

# Deleting a book integration test
RSpec.describe "Book Delete", type: :feature do
    scenario "deleting a book from the list of avail books" do
        date = DateTime.now.strftime('%a, %d %b %Y %H:%M:%S')
        mybook = Book.create!(title: 'New Book lol', author: 'Me', genre: 'Fiction', price: '10.99', published_date: date)
        visit root_path
        expect(page).to have_content('New Book lol')
        visit delete_book_path(id: mybook.id)
        expect(page).to have_content('Are you sure you want to delete this book')
        expect(page).to have_content('New Book lol')
        click_on 'Delete Book'
        expect(page).to have_content('Home Page')
        expect(page).not_to have_content('New Book lol')
    end
end