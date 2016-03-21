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

FactoryGirl.define do
  factory :lady_bug do
    log_id 1
    content "MyText"
  end
end
