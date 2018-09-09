require 'date'

class GerarArquivo
	
	def initialize()
		@success
	end

	def self.create(params)
		begin
			nomearquivo = "dinda-project_#{Time.now.strftime '%d-%m-%Y_%H-%M-%S'}.txt"
			f= File.new(nomearquivo, "w")

			params.each do |key, value|
				f.write "#{value[:name]};#{value[:email]};#{value[:login]};#{value[:avatar_url]};#{value[:commits_count]};\n"
			end
			f.close
			@success = true
		rescue
			@success = false
		end
	end
end