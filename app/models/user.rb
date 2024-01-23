class User < ApplicationRecord
  enum user_type: { standard: 0, admin: 1 }

  has_many :profiles
  has_many :interviews

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
