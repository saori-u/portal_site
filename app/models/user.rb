class User < ApplicationRecord
  devise    :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
  has_many  :portals
  has_many  :comments

  validates :name,         presence: true
  validates :profile,      presence: true
  validates :department,   presence: true
  validates :position,     presence: true
end
