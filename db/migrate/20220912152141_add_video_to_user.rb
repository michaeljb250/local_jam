class AddVideoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :video, :text
  end
end
