
# == Schema Information
#
# Table name: users
#
#  id    :integer          not null, primary key
#  name  :string
#  email :string
#

class User < ActiveRecord::Base
     has_many :logs
     has_many :ladybugs, through: :logs
     has_many :distortions, through: :logs
     has_many :beliefs, through: :logs
     has_many :tags, through: :logs

     validates :name, presence: true
     validates :email, presence: true
     
end
