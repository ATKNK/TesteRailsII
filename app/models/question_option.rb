class QuestionOption < ApplicationRecord
  belongs_to :question
  has_many: user_answer_history
end
