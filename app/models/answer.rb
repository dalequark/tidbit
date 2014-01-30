class Answer < ActiveRecord::Base
  validates :question_id, presence: true

  belongs_to :answer
  belongs_to :user
end
