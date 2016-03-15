# == Schema Information
#
# Table name: beliefs
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :belief do
    name "MyString"
  end
end
