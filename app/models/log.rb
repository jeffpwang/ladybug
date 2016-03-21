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

class Log < ActiveRecord::Base
	belongs_to :distortion
	belongs_to :user
	belongs_to :belief
	has_many :lady_bugs
	has_many :log_tags
	has_many :tags, through: :log_tags

	accepts_nested_attributes_for :belief
	accepts_nested_attributes_for :distortion
	accepts_nested_attributes_for :lady_bugs
	accepts_nested_attributes_for :tags
	
	validates :content, presence: true
	validates :before_rating, presence: true, :inclusion => 1..10
	validates :after_rating, presence: true, :inclusion => 1..10
	
	attr_reader :tag_new




	def tag_new=(string)
		arr_tags = string.split(/[\s, #]/).reject { |c| c.empty? }
		arr_tags.each do |tag|
			@tag = Tag.find_or_create_by(name: tag)
			self.tags << @tag
		end 
		self.save
	end


	def self.most_active_user
		Log.group(:user_id).order("count_id DESC").limit(1).count("id")
	end

end
