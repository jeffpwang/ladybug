class Tag < ActiveRecord::Base
	has_many :logtags
	has_many :logs, through: :logtags
end
