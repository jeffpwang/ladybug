# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#

class User < ActiveRecord::Base

     has_many :logs, dependent: :destroy
     has_many :lady_bugs, through: :logs
     has_many :distortions, through: :logs
     has_many :tags, through: :logs
     after_destroy :cleanup

     
	has_secure_password
     validates :name, presence: true, uniqueness: true
     validates :email, presence: true, uniqueness: true

     def average_after_mood
     	self.logs.average(:after_rating)
     end
     
     def average_before_mood
     	self.logs.average(:before_rating)
     end

     private
     
     def cleanup
          self.tags.destroy_all
          self.ladybugs.destroy_all
          self.distortions.destroy_all
          self.before_rating.destroy_all
          self.after_rating.destroy_all
     end

end
