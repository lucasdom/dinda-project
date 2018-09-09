require "spec_helper"

require_relative '../lib/organizarcommits'
require_relative '../lib/buscarcommits'
require_relative '../lib/gerararquivo'

RSpec.describe BuscarCommits do
	before do
		buscarCommits = BuscarCommits.new
		
		commitsOrganizados = OrganizarCommits.new(buscarCommits.get_json)
		@commits = Hash.new
		@commits = commitsOrganizados.commits
	end

	it "deve gerar arquivo" do
		gerararquivo = GerarArquivo.create(@commits)
		expect(gerararquivo).to eq(true)
	end

	it "deve dar erro ao gerar arquivo" do
		gerararquivo = GerarArquivo.create("")
		expect(gerararquivo).to eq(false)
	end

end