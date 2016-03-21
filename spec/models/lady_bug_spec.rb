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

require 'rails_helper'

RSpec.describe LadyBug, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
