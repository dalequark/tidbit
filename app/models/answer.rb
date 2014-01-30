class Answer < ActiveRecord::Base
  validates :question_id, presence: true

  belongs_to :question
  belongs_to :user
end
