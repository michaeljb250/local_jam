class AddPurposeToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :purpose, :string
  end
end
