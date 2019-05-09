class Test < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :answer_sheets, dependent: :destroy
end
