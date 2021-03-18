class ChangePublishType < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :published_date, :string
    add_column :books, :published_date, :date
  end
end
