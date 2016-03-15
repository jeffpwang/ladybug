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

FactoryGirl.define do
  factory :log_tag do
    log_id 1
    tag_id 1
  end
end
