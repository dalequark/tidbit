class Question < ActiveRecord::Base
  validates :user, presence: true
  has_many :answers
  belongs_to :user
  has_and_belongs_to_many :categorys
end
