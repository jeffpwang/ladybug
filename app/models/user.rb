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

     def popular_tags
          self.tags.group('tags.name').order('count_id desc').limit(1).count('id')
     end

     def popular_distortions
          self.distortions.group('distortions.name').order('count_id desc').limit(1).count('id')
     end

#group by day (created_at) get the average rating for each day
#return day with highest + lowest rating

     def saddest_day
          self.logs.group('logs.created_at').order('count_id').limit(1).count('id')
     end   

     private
     
     def cleanup
          self.tags.destroy
          self.lady_bugs.destroy
          self.distortions.destroy
     end

end
