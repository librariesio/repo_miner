module RepoMiner
  class Repository
    attr_reader :repo_path
    attr_reader :branch

    def initialize(repo_path)
      @repo_path = repo_path
    end

    def rugged_repository
      @repository ||= Rugged::Repository.new(repo_path)
    end

    def walk(branch)
      @walker = Rugged::Walker.new(rugged_repository)
      @walker.sorting(Rugged::SORT_TOPO | Rugged::SORT_REVERSE)
      @walker.push(rugged_repository.branches[branch].target_id)
      @walker
    end

    def analyse(branch = 'master')
      walk(branch).map do |commit|
        Commit.new(self, commit).analyse
      end
    end
  end
end
