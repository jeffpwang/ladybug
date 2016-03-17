# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#

FactoryGirl.define do
  factory :user do |f|
 	f.name "Tommy"
	f.email "tommy@gmail.com"
	f.password "abcdef"
  end
end
