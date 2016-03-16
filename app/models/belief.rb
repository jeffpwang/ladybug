# == Schema Information
#
# Table name: beliefs
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Belief < ActiveRecord::Base
	has_many :logs

  def ladybug_belief
    WHERE log_id = log.belief_id
  end

end
