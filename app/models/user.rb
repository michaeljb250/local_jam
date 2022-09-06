class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews, :follows
  has_many :groups, through: :user_groups
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, presence: true, uniqueness: true
  validates :instruments, presence: true
  validates :address, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
