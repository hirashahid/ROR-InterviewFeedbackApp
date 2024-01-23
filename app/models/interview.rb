class Interview < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  belongs_to :profile

  validates :company, :point_of_contact, :feedback, :status, :mode, presence: true
  validates :date, presence: true
  validates :follow_up_date, presence: true
  validate :follow_up_date_after_date

  private

  def follow_up_date_after_date
    return if date.blank? || follow_up_date.blank?

    errors.add(:follow_up_date, 'must be after the date') if follow_up_date <= date
  end
end
