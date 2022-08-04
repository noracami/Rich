class AddUserIdToArticle < ActiveRecord::Migration[6.1]
  def change
    # add_column :articles, :user_id, :integer
    add_reference :articles, :user
    # add_belongs_to :articles, :user
  end
end
