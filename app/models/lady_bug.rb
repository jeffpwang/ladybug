# == Schema Information
#
# Table name: lady_bugs
#
#  id         :integer          not null, primary key
#  log_id     :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LadyBug < ActiveRecord::Base
	belongs_to :log
	validates :content, presence: true
	#validates :content, uniqueness: true



	def self.get_ladybugs_for_a_user(user_id)
		LadyBug.joins(:log).where("logs.user_id" => user_id).group("lady_bugs.id")
	end	

end
