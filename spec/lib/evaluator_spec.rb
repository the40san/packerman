require "spec_helper"

describe Packerman::Evaluator do
  describe "#evaluate" do
    subject { Packerman::Evaluator.new.evaluate(template) }
    shared_examples_for :evaluated do
      it do
        expect(subject).to eq(hash)
      end
    end

    describe "Builder" do
      context "amazon-ebs" do
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

          block_device = AmiBlockDeviceMapping do
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
              AmiBlockDeviceMapping {
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

      context "amazon-instance" do
        let(:template) do
          <<-EOS.undent
          Builders type: :"amazon-instance" do
            access_key     "access_key"
            account_id     "account_id"
            ami_name       "whoami"
            instance_type  "t2.small"
            region         "ap-northeast-1"
            s3_bucket      "mybucket"
            secret_key     "itssecret"
            source_ami     "centos"
            ssh_username   "root"
            x509_cert_path "/path/to/cert"
            x509_key_path  "/path/to/key"
            ami_block_device_mappings [
              AmiBlockDeviceMapping {
                delete_on_termination true
                device_name "devise"
                encrypted false
                iops 200_000
                no_device true
                snapshot_id "omg"
                virtual_name "virrrtual"
                volume_type "type"
                volume_size 20
              }
            ]
            ami_description   "this is yours"
            ami_groups        ["group1", "group2"]
            ami_product_codes ["code1", "code2"]
            ami_regions       ["region1", "region2"]
            ami_users         ["user1", "user2"]
          end
          EOS
        end

        let(:hash) do
          {
            builders: [
              {
                type: "amazon-instance",
                access_key:     "access_key",
                account_id:     "account_id",
                ami_name:       "whoami",
                instance_type:  "t2.small",
                region:         "ap-northeast-1",
                s3_bucket:      "mybucket",
                secret_key:     "itssecret",
                source_ami:     "centos",
                ssh_username:   "root",
                x509_cert_path: "/path/to/cert",
                x509_key_path:  "/path/to/key",
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
                  }
                ],
                ami_description:   "this is yours",
                ami_groups:        ["group1", "group2"],
                ami_product_codes: ["code1", "code2"],
                ami_regions:       ["region1", "region2"],
                ami_users:         ["user1", "user2"]
              }
            ]
          }
        end

        it_behaves_like :evaluated
      end

      context "amazon-ebs" do
        let(:template) do
          <<-EOS.undent
          Builders type: :"amazon-chroot" do
            access_key "access_key"
            ami_name   "ami_name"
            secret_key "secret_key"
            source_ami "amazonlinux"
            ami_description "yours"
          end
          EOS
        end

        let(:hash) do
          {
            builders: [
              {
                type: "amazon-chroot",
                access_key: "access_key",
                ami_name:   "ami_name",
                secret_key: "secret_key",
                source_ami: "amazonlinux",
                ami_description: "yours"
              }
            ]
          }
        end

        it_behaves_like :evaluated
      end

      context "docker" do
        let(:template) do
          <<-EOS.undent
          Builders type: :"docker" do
            image "ubuntu"
            export_path "image.tar"
          end
          EOS
        end

        let(:hash) do
          {
            builders: [
              {
                type: "docker",
                image: "ubuntu",
                export_path: "image.tar"
              }
            ]
          }
        end

        it_behaves_like :evaluated
      end

      context "googlecompute" do
        let(:template) do
          <<-EOS.undent
          Builders type: "googlecompute" do
            account_file "account.json"
            project_id   "my-project"
            source_image "debian-7-wheezy-v20150127"
            zone         "us-central1-a"
          end
          EOS
        end

        let(:hash) do
          {
            builders: [
              {
                type:         "googlecompute",
                account_file: "account.json",
                project_id:   "my-project",
                source_image: "debian-7-wheezy-v20150127",
                zone:         "us-central1-a"
              }
            ]
          }
        end

        it_behaves_like :evaluated
      end

      context "null" do
        let(:template) do
          <<-EOS.undent
          Builders type: "null" do
            ssh_host     "127.0.0.1"
            ssh_username "foo"
            ssh_password "bar"
          end
          EOS
        end

        let(:hash) do
          {
            builders: [
              {
                type:         "null",
                ssh_host:     "127.0.0.1",
                ssh_username: "foo",
                ssh_password: "bar"
              }
            ]
          }
        end

        it_behaves_like :evaluated
      end

      context "virtualbox-iso" do
        let(:template) do
          <<-EOS.undent
          Builders type: "virtualbox-iso" do
            guest_os_type     "Ubuntu_64"
            iso_url           "http://releases.ubuntu.com/12.04/ubuntu-12.04.5-server-amd64.iso"
            iso_checksum      "769474248a3897f4865817446f9a4a53"
            iso_checksum_type "md5"
            ssh_username      "packer"
            ssh_password      "packer"
            shutdown_command  "echo 'packer' | sudo -S shutdown -P now"
          end
          EOS
        end

        let(:hash) do
          {
            builders: [
              {
                type:              "virtualbox-iso",
                guest_os_type:     "Ubuntu_64",
                iso_url:           "http://releases.ubuntu.com/12.04/ubuntu-12.04.5-server-amd64.iso",
                iso_checksum:      "769474248a3897f4865817446f9a4a53",
                iso_checksum_type: "md5",
                ssh_username:      "packer",
                ssh_password:      "packer",
                shutdown_command:  "echo 'packer' | sudo -S shutdown -P now"
              }
            ]
          }
        end

        it_behaves_like :evaluated
      end
    end

    describe "Provisioners" do
      context "shell" do
        let(:template) do
          <<-EOS.undent
          Builders type: :docker do
            image "centos"
            export_path "image.tar"
          end

          Provisioners type: :shell do
            script "echo $SHELL"
            binary true
          end
          EOS
        end

        let(:hash) do
          {
            builders: [
              {
                type: "docker",
                image: "centos",
                export_path: "image.tar"
              }
            ],
            provisioners: [
              {
                type: "shell",
                script: "echo $SHELL",
                binary: true
              }
            ]
          }
        end

        it_behaves_like :evaluated
      end

      context "chef-solo" do
        let(:template) do
          <<-EOS.undent
          Provisioners type: "chef-solo" do
            chef_attributes = { mysql: { version: "5.7", root_password: "plaintext" } }

            cookbook_paths ["cookbooks", "vendor"]
            json chef_attributes
            run_list [
              "role[web]",
              "recipe[mysql]"
            ]
          end
          EOS
        end

        let(:hash) do
          {
            provisioners: [
              {
                type: "chef-solo",
                cookbook_paths: ["cookbooks", "vendor"],
                json: { mysql: { version: "5.7", root_password: "plaintext" } },
                run_list: ["role[web]", "recipe[mysql]"]
              }
            ]
          }
        end

        it_behaves_like :evaluated
      end
    end

    describe "Variables" do
      let(:template) do
        <<-EOS.undent
        Variables do
          aws_access_key_id '{{env `AWS_ACCESS_KEY_ID`}}'
          aws_secret_access_key '{{env `AWS_SECRET_ACCESS_KEY`}}'
        end
        EOS
      end

      let(:hash) do
        {
          variables: {
            aws_access_key_id:     '{{env `AWS_ACCESS_KEY_ID`}}',
            aws_secret_access_key: '{{env `AWS_SECRET_ACCESS_KEY`}}'
          }
        }
      end

      it_behaves_like :evaluated
    end
  end
end
