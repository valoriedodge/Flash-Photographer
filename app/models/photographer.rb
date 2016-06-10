class Photographer < ActiveRecord::Base
  before_save {self.email = email.downcase}
  after_initialize { self.level ||= :standard}

  acts_as_mappable

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum level: [:standard, :premium, :admin]
end
