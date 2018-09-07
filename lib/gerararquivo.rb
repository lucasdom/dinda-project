require 'date'

class GerarArquivo
	def self.create()
		f= File.new("dinha-project_#{Time.now.strftime '%d-%m-%Y_%H-%M-%S'}.txt", "w")
        f.write("teste")
        
		f.close
	end
end