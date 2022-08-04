class AddDeleteAtToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :deleted_at, :date
    add_index :articles, :deleted_at
  end
end
