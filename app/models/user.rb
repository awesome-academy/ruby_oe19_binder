class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_one :test, dependent: :destroy
  has_many :answer_sheets, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.user_valid.max_length_name}
  validates :email, presence: true,
    length: {maximum: Settings.user_valid.max_length_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.user_valid.min_length_password}
  validates :gender, presence: true, inclusion: %w(male female else)
  validates :date_of_birth,
    timeliness: {on_or_before: ->{Date.current}, type: :date}
  validates :about, presence: true,
    length: {maximum: Settings.user_valid.max_about}
  before_save :email_downcase
  has_secure_password

  private

  def email_downcase
    email.downcase!
  end
end
