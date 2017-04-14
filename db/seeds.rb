require 'CSV'


def shorten
	return ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(5).join
end

urls_a = []

CSV.foreach("./db/urls") do |row|
  long_url = row[0].match(/http:\/\/.+\)/).to_s.delete(")")
  short_url = shorten
  urls_a << "('#{long_url}','#{short_url}')"
end

urls = urls_a.join(",") + ";"

Url.transaction do
  Url.connection.execute "INSERT INTO urls (long_url,short_url) VALUES #{urls}"
end

