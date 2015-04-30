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

	def add_http
		if !self.link.start_with?("http://")
			self.link.prepend("http://") 
			self.save 
		end
	end

	def self.find_or_create_link(permited_params)
		future_link = Link.find_with_http(permited_params)
		if !future_link
			new_link = Link.new(permited_params)
			new_link.generate_short_link(3)
			new_link.save
			new_link
		else
			future_link
		end
	end

	def self.find_with_http(params)
		original_link = params[:link]
   		original_link.prepend("http://") if !original_link.start_with?("http://") && !original_link.empty?

   		link = Link.find_by link: original_link

	end
end
