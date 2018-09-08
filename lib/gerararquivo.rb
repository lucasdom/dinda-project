require 'date'

class GerarArquivo
	def self.create(params)
		f= File.new("dinha-project_#{Time.now.strftime '%d-%m-%Y_%H-%M-%S'}.txt", "w")

        params.each do |key, value|
			f.write "#{value[:name]};#{value[:email]};#{value[:login]};#{value[:avatar_url]};#{value[:commits_count]};\n"
		end
		f.close
	end
end