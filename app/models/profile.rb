class Profile < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_many :interviews

  has_one_attached :resume

  validates :name, :address, :timezone, :resume, presence: true
  validates :email, presence: true, uniqueness: true

end