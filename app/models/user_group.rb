class UserGroup < ApplicationRecord
  belongs_to :groups, :users
end
