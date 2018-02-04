require 'licensee'

module RepoMiner
  module Miners
    class Licenses
      def analyse(commit)
        return if commit.merge?

        licensee_project = Licensee::Projects::GitProject.new(commit.repository.rugged_repository, revision: commit.sha)

        data = licensee_project.license_files.map do |license_file|
          {
            path: license_file.path,
            key: license_file.match.key,
            confidence: license_file.confidence
          }
        end

        commit.add_data(:licenses, data)
      end
    end
  end
end
