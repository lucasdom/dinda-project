require 'json'

class OrganizarCommits
	attr_reader :commits
	
	def initialize(params)
		@commits = Hash.new
		@commits = filtrar_unificar_commits(params)
	end
	
	private

	def filtrar_unificar_commits(params)
			
		params.each do |item|
			usuario = item['commit']['author']
			key = usuario['email']
			value = { 
				name: usuario['name'],
				email: usuario['email'],
				login: item['author'] ? item['author']['login'] : "",
				avatar_url: item['author']  ? item['author']['avatar_url'] : "",
				commits_count: 0 
			}
			
			commits[key] ||= value
			commits[key][:commits_count] += 1
		end
		
		@commits = organizar(commits)
		
	end

	def organizar(params)
		params.sort_by{ |k, v| v[:commits_count]}.reverse
	end
end