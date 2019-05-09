class Message < ApplicationRecord
  belongs_to :user
  belongs_to :test_result
end
