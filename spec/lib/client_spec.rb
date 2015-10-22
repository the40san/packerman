require "spec_helper"

describe Packerman::Client do
  describe "#convert" do
    let(:template) do
      <<-EOS.undent
      Builders type: "amazon-ebs" do
        access_key "hoge"
      end
      EOS
    end

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

    subject { Packerman::Client.new.convert(template) }

    it "returns json like" do
      expect(subject).to eq expected
    end
  end
end
