class Question < ActiveRecord::Base
  validates :user, presence: true
  has_many :answers
  belongs_to :user
end
