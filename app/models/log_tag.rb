# == Schema Information
#
# Table name: log_tags
#
#  id         :integer          not null, primary key
#  log_id     :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LogTag < ActiveRecord::Base
	belongs_to :log
	belongs_to :tag
end
