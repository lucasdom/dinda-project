require 'date'

class GerarArquivo
	def self.create(params)
		f= File.new("dinha-project_#{Time.now.strftime '%d-%m-%Y_%H-%M-%S'}.txt", "w")
        f.write("#{params}")
        
		f.close
	end
end