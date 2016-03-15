class Log < ActiveRecord::Base
	belongs_to :distortion
	belongs_to :user
	belongs_to :belief
	has_many :ladybugs
	has_many :log_tags
	has_many :tags, through: :log_tags

	accepts_nested_attributes_for :belief
	accepts_nested_attributes_for :distortion
	accepts_nested_attributes_for :ladybugs
	accepts_nested_attributes_for :tags
	
end
