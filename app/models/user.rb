class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :recoverable, :rememberable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable, :validatable, :omniauthable
end
