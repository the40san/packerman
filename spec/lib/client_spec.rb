require "spec_helper"
require 'tempfile'

describe Packerman::Client do
  describe "#convert" do
    let(:expected) do
      <<-EOS.undent
      {
        "builders": [
          {
            "type": "amazon-ebs",
            "access_key": "hoge"
          }
        ]
      }
      EOS
    end

    subject do
      Packerman::Client.new.convert(File.join("spec", "support", "template.rb"))
      File.open("template.json").read
    end

    it "returns json like" do
      expect(subject).to eq expected
    end

    after do
      File.delete("template.json")
    end
  end
end
