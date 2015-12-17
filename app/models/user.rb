class User < ActiveRecord::Base
  has_secure_password

  has_many :logs, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :first_name, :last_name, presence: true
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
end
