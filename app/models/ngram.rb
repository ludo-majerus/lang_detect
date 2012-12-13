class Ngram < ActiveRecord::Base
	belongs_to :lang
	attr_accessible :ngram, :stats

end
