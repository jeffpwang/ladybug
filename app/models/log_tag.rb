class LogTag < ActiveRecord::Base
	belongs_to :log
	belongs_to :tag
end
