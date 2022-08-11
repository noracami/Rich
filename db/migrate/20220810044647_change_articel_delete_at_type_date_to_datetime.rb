class ChangeArticelDeleteAtTypeDateToDatetime < ActiveRecord::Migration[6.1]
  def change
    change_column :articles, :deleted_at, :datetime
  end
end
