# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
	has_many :logtags
	has_many :logs, through: :logtags

  validates :name, :uniqueness => true

  def tag_new
  end 
end
