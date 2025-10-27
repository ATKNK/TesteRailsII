class Question < ApplicationRecord

  default_scope { where(deleted_at: nil)}

  scope :active, -> { where(deleted_at: nil) }
  scope :deleted, -> {where.not(deleted_at: nil)}

  def soft_delete
    update(deleted_at: Time.current)
  end

  def destroy
    soft_delete
  end
  
  belongs_to :questionnaire
  has_many :question_options, dependent: :destroy
  has_many :user_answer_history

  accepts_nested_attributes_for :question_options, allow_destroy: true
end
