require "spec_helper"

RSpec.describe RepoMiner do
  it "has a version number" do
    expect(RepoMiner::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(RepoMiner.analyse('../libraries').length).to eq(4792)
  end
end
