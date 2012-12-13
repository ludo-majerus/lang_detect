class Text < ActiveRecord::Base
	belongs_to :lang
	attr_accessible :content

end
