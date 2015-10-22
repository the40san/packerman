require "spec_helper"

describe Packerman::Evaluator do
  describe "#evaluate" do
    subject { Packerman::Evaluator.new.evaluate(template) }
    shared_examples_for :evaluated do
      it do
        expect(subject).to eq(hash)
      end
    end

    context "Builder only template" do
      let(:template) do
        <<-EOS.undent
        Builders type: :"amazon-ebs" do
          access_key    "access_key"
          ami_name      "whoami"
          instance_type "t2.micro"
          region        "ap-northeast-1"
          secret_key    "secret_key"
          source_ami    "iam_amazon_linux"
          ssh_username  "ec2-user"
        end

        block_device = AmiBlockDeviceMapping.register do
          delete_on_termination true
          device_name "devise"
          encrypted false
          iops 200_000
          no_device true
          snapshot_id "omg"
          virtual_name "virrrtual"
          volume_type "type"
          volume_size 20
        end

        Builders type: :"amazon-ebs" do
          access_key    "access_key"
          ami_name      "whoami2"
          instance_type "t2.small"
          region        "ap-northeast-1"
          secret_key    "secret_key"
          source_ami    "iam_ubuntu"
          ssh_username  "ubuntu"
          ami_block_device_mappings [
            AmiBlockDeviceMapping.register {
              delete_on_termination true
              device_name "devise"
              encrypted false
              iops 200_000
              no_device true
              snapshot_id "omg"
              virtual_name "virrrtual"
              volume_type "type"
              volume_size 20
            },
            block_device
          ]
        end
        EOS
      end

      let(:hash) do
        {
          builders: [
            {
              type: "amazon-ebs",
              access_key: "access_key",
              ami_name: "whoami",
              instance_type: "t2.micro",
              region: "ap-northeast-1",
              secret_key: "secret_key",
              source_ami: "iam_amazon_linux",
              ssh_username: "ec2-user"
            },
            {
              type: "amazon-ebs",
              access_key: "access_key",
              ami_name: "whoami2",
              instance_type: "t2.small",
              region: "ap-northeast-1",
              secret_key: "secret_key",
              source_ami: "iam_ubuntu",
              ssh_username: "ubuntu",
              ami_block_device_mappings: [
                {
                  delete_on_termination: true,
                  device_name: "devise",
                  encrypted: false,
                  iops: 200_000,
                  no_device: true,
                  snapshot_id: "omg",
                  virtual_name: "virrrtual",
                  volume_type: "type",
                  volume_size: 20
                },
                {
                  delete_on_termination: true,
                  device_name: "devise",
                  encrypted: false,
                  iops: 200_000,
                  no_device: true,
                  snapshot_id: "omg",
                  virtual_name: "virrrtual",
                  volume_type: "type",
                  volume_size: 20
                }
              ]
            }
          ]
        }
      end

      it_behaves_like :evaluated
    end
  end
end
