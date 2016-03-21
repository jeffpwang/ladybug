# == Schema Information
#
# Table name: log_lady_bugs
#
#  id          :integer          not null, primary key
#  log_id      :integer
#  lady_bug_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LogLadyBug < ActiveRecord::Base
  belongs_to :log
  belongs_to :lady_bug
end
