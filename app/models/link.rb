class Link < ActiveRecord::Base
	validates :link, uniqueness: true, presence: true
end
