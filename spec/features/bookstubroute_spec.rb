require 'rails_helper'

# Book stub test
RSpec.describe "Book Stub", type: :request do
    describe "request list of all books" do
        it 'can be routed to' do
            # date = DateTime.now.strftime('%a, %d %b %Y %H:%M:%S')
            # mybook = Book.create(title: 'New Book', author: 'Me', genre: 'Fiction', price: '10.99', published_date: date)
            mybook = Book.create(title: nil, author: nil, genre: nil, price: nil, published_date: nil)
            get books_path
            expect(response).to be_successful
        end
    end
end