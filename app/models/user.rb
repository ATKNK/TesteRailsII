class User < ApplicationRecord

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
end
