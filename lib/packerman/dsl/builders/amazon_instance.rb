class Packerman::Dsl::Builders::AmazonInstance < Packerman::Dsl::Builders
  def type
    "amazon-instance"
  end

  class << self
    def require_keys
      [
        :access_key,
        :account_id,
        :ami_name,
        :instance_type,
        :region,
        :s3_bucket,
        :secret_key,
        :source_ami,
        :ssh_username,
        :x509_cert_path,
        :x509_key_path
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
        :ami_virtualization_type,
        :associate_public_ip_address,
        :availability_zone,
        :bundle_destination,
        :bundle_prefix,
        :bundle_upload_command,
        :bundle_vol_command,
        :ebs_optimized,
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
        :user_data,
        :user_data_file,
        :vpc_id,
        :x509_upload_path,
        :windows_password_timeout
      ]
    end
  end
end
