class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :portal

  validates :text,  presence: true
end
