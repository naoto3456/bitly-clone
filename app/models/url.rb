class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :long_url, format: { with: /\Ahttps?:\/\/.+/, message:"has to start with 'https://' or 'http://' "}

	before_create:shorten

	def shorten
		self.short_url = ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(5).join
	end

end
