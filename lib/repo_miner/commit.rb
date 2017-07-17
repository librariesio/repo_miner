module RepoMiner
  class Commit
    attr_reader :repository
    attr_reader :commit
    attr_accessor :data

    def initialize(repository, commit)
      @repository = repository
      @commit = commit
      @data = {}
    end

    def analyse
      # for every miner (except Base) analyse commit
      Miners::Email.new.analyse(self)
      Miners::Dependencies.new.analyse(self)

      self
    end

    def add_data(key, miner_data)
      data[key] = miner_data
    end

    def content_before(file_path)
      content_for_commit(commit.parents[0], file_path)
    end

    def content_after(file_path)
      content_for_commit(commit, file_path)
    end

    private

    def content_for_commit(rugged_commit, file_path)
      path = rugged_commit.tree.path(file_path)
      blob = repository.rugged_repository.lookup(path[:oid])
      blob.content
    end
  end
end
