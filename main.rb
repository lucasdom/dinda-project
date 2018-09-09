require_relative 'lib/gerararquivo'
require_relative 'lib/buscarcommits'
require_relative 'lib/organizarcommits'

buscarCommits = BuscarCommits.new

commitsOrganizados = OrganizarCommits.new(buscarCommits.get_json)
GerarArquivo.create(commitsOrganizados.commits)
