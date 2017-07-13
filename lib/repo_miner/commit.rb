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
  end
end
