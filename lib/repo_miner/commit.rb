module RepoMiner
  class Commit
    def initialize(repository, commit)
      @repository = repository
      @commit = commit
    end

    def analyse
      @commit.to_hash
    end
  end
end
