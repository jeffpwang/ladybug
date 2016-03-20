# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
	has_many :log_tags
	has_many :logs, through: :log_tags

  	#validates :name, :uniqueness => true

	def find_logs_for_tag(user_id)  
		self.logs.where("user_id" => user_id)
	end 

	#get all of the logs
	#for a user
	#for a tag

	#get all of the tags for a user

	def self.get_tags_for_a_user(user_id)
		Tag.joins(:logs).where("logs.user_id" => user_id).group("tags.id")
	end

end
