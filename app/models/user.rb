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

     has_many :logs
     has_many :lady_bugs, through: :logs
     has_many :distortions, through: :logs
     has_many :beliefs, through: :logs
     has_many :tags, through: :logs
     
	has_secure_password
     validates :name, presence: true, uniqueness: true
     validates :email, presence: true, uniqueness: true

     def average_after_mood
     	self.logs.average(:after_rating).to_i
     end
     
     def average_before_mood
     	self.logs.average(:before_rating).to_i
     end

     def pair_of_ratings
          self.logs.pluck(:before_rating, :after_rating)
     end 

     def each_rating_average
          pair_of_ratings.map do |x, y| 
               (x + y) / 2.0
          end 
     end 

     def average_overall
          each_rating_average.sum / self.logs.count
     end 

     def recent_logs
         Log.all.where(created_at: 5.days.ago..Time.now).where(user_id: self.id)
     end 

     def recent_ratings
     end 

     def recent_logs_with_ratings
         date_array = recent_logs.pluck(:created_at).map do |date|
          date.strftime("%A %b, %e | %I:%M %p ") 
         end 
     end 


end
