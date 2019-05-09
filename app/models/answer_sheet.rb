class AnswerSheet < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :answer
  has_one :test_result, dependent: :destroy
end
