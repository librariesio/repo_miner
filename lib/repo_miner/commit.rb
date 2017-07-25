module RepoMiner
  class Commit
    attr_reader :repository
    attr_reader :rugged_commit
    attr_accessor :data

    def initialize(repository, rugged_commit)
      @repository = repository
      @rugged_commit = rugged_commit
      @data = {}
    end

    def message
      rugged_commit.message.strip
    end

    def sha
      rugged_commit.oid
    end

    def timestamp
      rugged_commit.time
    end

    def merge?
      rugged_commit.parents.length > 1
    end

    def analyse
      Miners::Email.new.analyse(self)
      Miners::Dependencies.new.analyse(self)

      self
    end

    def add_data(key, miner_data)
      data[key] = miner_data
    end

    def content_before(file_path)
      content_for_commit(rugged_commit.parents[0], file_path)
    end

    def content_after(file_path)
      content_for_commit(rugged_commit, file_path)
    end

    def inspect
      "<RepoMiner::Commit:#{"0x00%x" % (object_id << 1)}(message: '#{message}', sha: '#{sha}', data: #{data})>"
    end

    private

    def content_for_commit(rugged_commit, file_path)
      path = rugged_commit.tree.path(file_path)
      blob = repository.rugged_repository.lookup(path[:oid])
      blob.content
    end
  end
end
