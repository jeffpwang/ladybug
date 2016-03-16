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


	

end
