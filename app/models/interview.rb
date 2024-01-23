class Interview < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  belongs_to :profile
end
