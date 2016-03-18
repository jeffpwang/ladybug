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
     	self.logs.average(:after_rating).to_i
     end
     
     def average_before_mood
     	self.logs.average(:before_rating).to_i
     end


     def popular_tags
          self.tags.group('tags.name').order('count_id desc').limit(1).count('id')
     end

     def top_five_tags
          self.tags.group('tags.name').order('count_id desc').limit(5).count('id')
     end

     def popular_distortions
          self.distortions.group('distortions.name').order('count_id desc').limit(1).count('id')
     end

     def all_distortions
          self.distortions.group('distortions.name').order('count_id desc').count('id')
     end

#group by day (created_at) get the average rating for each day
#return day with highest + lowest rating

     def saddest_day
          pair_of_ratings_with_dates.each do |before, after, date| 
               lowest_avg = 0 
               lowest_date = ''
               avg = ((before + after) / 2)
               if avg < lowest_avg || lowest_avg == 0 
                 lowest = avg
                 lowest_date = date
               end 
               return lowest_date
          end 
     end   

     
     def cleanup_logs
          self.logs.clear
     end

     def pair_of_ratings_with_dates
          self.logs.pluck(:before_rating, :after_rating, :created_at)
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
          each_rating_average.sum / self.logs.count unless self.logs.count == 0 
     end 

     def recent_logs
         Log.all.where(created_at: 5.days.ago..Time.now).where(user_id: self.id)
     end 

     def recent_ratings
          each_rating_average.last(5)
     end 

     def recent_logs_with_ratings
         date_array = recent_logs.pluck(:created_at).map do |date|
          date
         end 
         date_array.last(5).zip(recent_ratings)
     end 

end
