class Packerman::Dsl::Builders::AmazonEbs < Packerman::Dsl::Builders
  def type
    "amazon-ebs"
  end

  class << self
    def require_keys
      [
        :access_key,
        :ami_name,
        :instance_type,
        :region,
        :secret_key,
        :source_ami,
        :ssh_username,
      ]
    end

    def optional_keys
      [
        :ami_block_device_mappings,
        :ami_description,
        :ami_groups,
        :ami_product_codes,
        :ami_regions,
        :ami_users,
        :associate_public_ip_address,
        :availability_zone,
        :enhanced_networking,
        :force_deregister,
        :iam_instance_profile,
        :launch_block_device_mappings,
        :run_tags,
        :security_group_id,
        :security_group_ids,
        :spot_price,
        :spot_price_auto_product,
        :ssh_keypair_name,
        :ssh_private_ip,
        :subnet_id,
        :tags,
        :temporary_key_pair_name,
        :token,
        :user_data,
        :user_data_file,
        :vpc_id,
        :windows_password_timeout,
      ]
    end

    class AmiBlockDeviceMapping < Packerman::Dsl::HashObject
      class << self
        def optional_keys
          [
            :delete_on_termination,
            :device_name,
            :encrypted,
            :iops,
            :no_device,
            :snapshot_id,
            :virtual_name,
            :volume_type,
            :volume_size
          ]
        end
      end
    end
  end
end
