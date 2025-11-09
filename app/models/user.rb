class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  default_scope { where(deleted_at: nil)}

  scope :active, -> { where(deleted_at: nil) }
  scope :deleted, -> {where.not(deleted_at: nil)}

  def soft_delete
    update(deleted_at: Time.current)
  end

  def destroy
    soft_delete
  end

  has_and_belongs_to_many :roles
  has_many :user_results
  has_many :user_answer_history
end
