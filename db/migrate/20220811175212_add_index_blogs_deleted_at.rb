class AddIndexBlogsDeletedAt < ActiveRecord::Migration[6.1]
  def change
    add_index :blogs, :deleted_at
  end
end
