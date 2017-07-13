require 'repo_miner/version'
require 'repo_miner/repository'
require 'repo_miner/commit'
require 'rugged'

module RepoMiner
  def self.analyse(repo_path, branch = 'master')
    Repository.new(repo_path).analyse(branch)
  end
end
