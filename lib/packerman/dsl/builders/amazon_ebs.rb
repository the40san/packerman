class Packerman::Dsl::Builders::AmazonEbs < Packerman::Dsl::Builders
  include Packerman::Dsl::Node

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
  end
end
