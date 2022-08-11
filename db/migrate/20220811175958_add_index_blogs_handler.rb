class AddIndexBlogsHandler < ActiveRecord::Migration[6.1]
  def change
    add_index :blogs, :handler
  end
end
