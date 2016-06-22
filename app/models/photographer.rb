class Photographer < ActiveRecord::Base
  before_save {self.email = email.downcase}
  after_initialize { self.level ||= :standard}
  after_initialize { self.wttravel ||= false}

  validates :first_name, length: { minimum: 2 }, presence: true
  validates :last_name, length: { minimum: 2 }, presence: true
  validates :bio, length: { minimum: 5, maximum: 500 }, presence: true
  validates :zip, presence: true
  validates :yrs_experience, presence: true, numericality: true

  belongs_to :location
  has_many :reviews
  has_one :specialties

  acts_as_mappable #through: :location

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum level: [:standard, :premium, :admin]
end
