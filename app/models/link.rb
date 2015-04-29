class Link < ActiveRecord::Base
	validates :link, uniqueness: true, presence: true
	validates :shortlink, uniqueness: true, presence: true

	def generate_short_link(characters)
		chain = gen_random_chain(characters)
		
		while (Link.find_by shortlink: chain) do
			binding.pry
			chain = gen_random_chain(characters)
		end

		self.shortlink = chain
	end

	def gen_random_chain(characters)
		chain =""
		characters.times do |n|
			character = rand(48..122)
			character = rand(48..122) while (58..64).include?(character) || (91..97).include?(character)
			chain << character.chr
		end
		chain
	end

	def update_visits
		self.visits += 1
    	self.last_visit = Date.today
    	self.save
	end


end
