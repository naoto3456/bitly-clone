class ChangeUrls < ActiveRecord::Migration
	def change
		add_column :urls, :click_count, :integer , default: 0, null: false
	end
end
