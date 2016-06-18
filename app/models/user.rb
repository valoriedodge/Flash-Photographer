class User < ActiveRecord::Base
  after_initialize { self.level ||= :standard}

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  
  enum level: [:standard, :premium, :admin]

end
