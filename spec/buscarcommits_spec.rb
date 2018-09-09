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

	it "commits nao podem ser vazios" do
		expect(@commits).not_to be_empty
	end

	it "commit anterior deve ser maior ou igual ao proximo" do

		valoranterior = Hash.new
		listaorganizada = true
		@commits.each do |key, value|
			if valoranterior.length > 0
				if valoranterior[:commits_count] < value[:commits_count]
					listaorganizada = false
					break
				end
			end
			valoranterior = value	
		end

		expect(listaorganizada).to eq(true)
	end

	it "Commits devem ser diferentes" do
		valoranterior = Hash.new
		listaunificada = true
		@commits.each do |key, value|
			if valoranterior.length > 0
				if value == valoranterior
					listaunificada = false
					break
				end
			end
			valoranterior = value	
		end
		expect(listaunificada).to eq(true)
	end

end