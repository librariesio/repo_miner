require 'repo_miner/version'
require 'repo_miner/repository'
require 'repo_miner/commit'

Dir[File.expand_path('../repo_miner/miners/*.rb', __FILE__)].each do |file|
  require file
end

require 'rugged'

module RepoMiner
  def self.analyse(repo_path, branch = 'master', since = nil)
    Repository.new(repo_path).analyse(branch, since)
  end
end
