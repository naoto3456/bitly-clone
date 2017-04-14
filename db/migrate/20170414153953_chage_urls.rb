class ChageUrls < ActiveRecord::Migration
	def change
		add_index :urls, :short_url
	end
end
