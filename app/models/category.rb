class Category < ActiveRecord::Base
	has_many :projects, dependent: :destroy
	belongs_to :user

	validates :category, presence: true
end
