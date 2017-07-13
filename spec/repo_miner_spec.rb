require "spec_helper"

RSpec.describe RepoMiner do
  it "has a version number" do
    expect(RepoMiner::VERSION).not_to be nil
  end

  context "when mining the Libraries.io repository" do
    let(:analyser) { RepoMiner.analyse('../libraries') }

    it "does something useful" do
      expect(analyser.length).to eq(4792)
    end

    it "mines email addresses" do
      initial_commit = analyser.first
      expect(initial_commit.data).to eq({
        :email => {
          committer: 'andrewnez@gmail.com',
          author: 'andrewnez@gmail.com'
        }
      })
    end
  end
end
