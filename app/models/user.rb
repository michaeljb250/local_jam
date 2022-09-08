class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower
  has_one_attached :photo
  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following
  has_many :reviewers, foreign_key: :reviewer_id, class_name: 'Review'
  has_many :reviewees, foreign_key: :reviewee_id, class_name: 'Review'
  has_many :follows
  has_many :user_groups
  has_many :groups, through: :user_groups
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, presence: true, uniqueness: true
  validates :instrument, presence: true
  validates :address, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def is_following?(user_id)
    relationship = Follow.find_by(follower_id: id, following_id: user_id)
    return true if relationship
  end
end
