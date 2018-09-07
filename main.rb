require_relative 'lib/gerararquivo'
require_relative 'lib/buscarcommits'

buscarCommits = BuscarCommits.new

puts "Gerando arquivo"
GerarArquivo.create(buscarCommits.get_response_json)