# == Schema Information
#
# Table name: logs
#
#  id            :integer          not null, primary key
#  content       :text
#  before_rating :integer
#  after_rating  :integer
#  distortion_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  belief_id     :integer
#

FactoryGirl.define do
  factory :log do
    content "MyText"
    before_rating 1
    after_rating 1
    distortion_id 1
    user_id 1
  end
end
