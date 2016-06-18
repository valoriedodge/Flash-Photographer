class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :photographer

  #validates :value, inclusion: { in: [0, 5], message: "%{value} is not a valid vote." }, presence: true
  validates :comment, length: { minimum: 5 }, presence: true
  validates :user, uniqueness: {scope: :photographer}, presence: true
  validates :photographer, presence: true
end
