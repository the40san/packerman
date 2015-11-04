class Packerman::Dsl::Builders::AmazonChroot < Packerman::Dsl::Builders
  include Packerman::Dsl::Node

  def type
    "amazon-chroot"
  end

  class << self
    def require_keys
      [
        :access_key,
        :ami_name,
        :secret_key,
        :source_ami
      ]
    end

    def optional_keys
      [
        :ami_description,
        :ami_groups,
        :ami_product_codes,
        :ami_regions,
        :ami_users,
        :ami_virtualization_type,
        :chroot_mounts,
        :command_wrapper,
        :copy_files,
        :device_path,
        :enhanced_networking,
        :force_deregister,
        :mount_path,
        :mount_options,
        :root_volume_size,
        :tags
      ]
    end
  end
end
