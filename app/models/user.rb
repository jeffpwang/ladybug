class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

     has_many :logs
     has_many :ladybugs, through: :logs
     has_many :distortions, through: :logs
     has_many :beliefs, through: :logs
     has_many :tags, through: :logs
end
