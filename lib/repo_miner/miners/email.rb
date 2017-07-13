module RepoMiner
  module Miners
    class Email
      def analyse(commit)
        # analyse commit
        committer_email = commit.commit.committer[:email]
        author_email = commit.commit.author[:email]

        # attach mined info to commit
        commit.add_data(:email, {
          committer: committer_email,
          author: author_email
        })

        # return the commit
        commit
      end
    end
  end
end
