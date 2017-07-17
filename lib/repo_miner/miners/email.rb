module RepoMiner
  module Miners
    class Email
      def analyse(commit)
        # analyse commit
        committer_email = commit.rugged_commit.committer[:email]
        author_email = commit.rugged_commit.author[:email]

        # attach mined info to commit
        commit.add_data(:email, {
          committer: committer_email,
          author: author_email
        })
      end
    end
  end
end
