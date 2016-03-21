# == Schema Information
#
# Table name: lady_bugs
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class LadyBug < ActiveRecord::Base
  belongs_to :user
	has_many :log_lady_bugs
  has_many :logs, through: :log_lady_bugs
	validates :content, presence: true
	#validates :content, uniqueness: true


	

end
