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

  	validates :name, :uniqueness => true

	def find_logs_for_tag(user_id)  
		self.logs.where("user_id" => user_id)
	end 

	#get all of the logs
	#for a user
	#for a tag

end
