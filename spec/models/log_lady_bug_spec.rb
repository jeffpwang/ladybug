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

require 'rails_helper'

RSpec.describe LogLadyBug, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
