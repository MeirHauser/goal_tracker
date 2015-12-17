class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :logs, dependent: :destroy

  validates :name, :section, presence: true
  validates :amount, presence: true
end
