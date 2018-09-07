require 'net/http'
require 'uri'
require 'json'

class BuscarCommits

	def initialize()
		uri = URI.parse("https://api.github.com/repos/Dinda-com-br/braspag-rest/commits")
		@response = Net::HTTP.get_response(uri)
	end

	def get_response_json
		JSON.parse(@response.body)
	end

end