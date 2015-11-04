class Packerman::Dsl::Builders::Googlecompute < Packerman::Dsl::Builders
  include Packerman::Dsl::Node

  def type
    "googlecompute"
  end

  class << self
    def require_keys
      [
        :project_id,
        :source_image,
        :zone
      ]
    end

    def optional_keys
      [
        :account_file,
        :disk_size,
        :image_name,
        :image_description,
        :instance_name,
        :machine_type,
        :metadata,
        :network,
        :state_timeout,
        :tags,
        :use_internal_ip
      ]
    end
  end
end
