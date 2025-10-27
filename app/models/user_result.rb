class UserResult < ApplicationRecord
  belongs_to :user
  belongs_to :questionnaires
end
