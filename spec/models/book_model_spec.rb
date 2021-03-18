require 'rails_helper'

RSpec.describe "Book Model Validations", type: :model do
    context 'unit model tests' do
        date = DateTime.now.strftime('%a, %d %b %Y %H:%M:%S')
        
        # Omits the field that we need present and expects invalid object
        it 'ensures title is present' do
            test_book = Book.new(author: 'Me', genre: 'Fiction', price: '10.99', published_date: date).save
            expect(test_book).to eq(false)
        end

        it 'ensures author is present' do
            test_book = Book.new(title: 'New Book lol', genre: 'Fiction', price: '10.99', published_date: date).save
            expect(test_book).to eq(false)
        end
        
        it 'ensures genre is present' do
            test_book = Book.new(title: 'New Book lol', author: 'Me', price: '10.99', published_date: date).save
            expect(test_book).to eq(false)
        end

        it 'ensures price boolean is present' do
            test_book = Book.new(title: 'New Book lol', author: 'Me', genre: 'Fiction', published_date: date).save
            expect(test_book).to eq(false)
        end

        it 'ensures published date boolean is present' do
            test_book = Book.new(title: 'New Book lol', author: 'Me', genre: 'Fiction', price: '10.99').save
            expect(test_book).to eq(false)
        end

        it 'should save successfully' do
            test_book = Book.new(title: 'New Book lol', author: 'Me', genre: 'Fiction', price: '10.99', published_date: date).save
        end

    end

    # context 'scopes tests' do

    #     let (:params) {{title: 'New Book lol', author: 'Me', genre: 'Fiction', price: '10.99', published_date: date}}

    #     before(:each) do
    #         Book.new(title: 'New Book lol', author: 'Me', genre: 'Fiction', price: '10.99', published_date: date).save
    #         Book.new(title: 'New Book lol', author: 'Me', genre: 'Fiction', price: '10.99', published_date: date).save
    #         Book.new(title: 'New Book lol', author: 'Me', genre: 'Fiction', price: '10.99', published_date: date).save
    #     end

    #     it 'should return avail Book' do
    #         expect(Book.avail_items.size).to eq(2)
    #     end

    #     it 'should return non avail Book' do
    #         expect(Book.not_avail_items.size).to eq(3)
    #     end
    # end
end