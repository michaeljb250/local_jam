class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User", foreign_key: :reviewer_id
  validates :content, presence: true
end
