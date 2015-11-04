class Packerman::Dsl::Builders < Packerman::Dsl
  include Packerman::Dsl::Node

  class << self
    def hash_key
      [:type] + require_keys + optional_keys + communicator_keys
    end

    def communicator_keys
      [
        :communicator,
        :ssh_host,
        :ssh_port,
        :ssh_username,
        :ssh_password,
        :ssh_private_key_file,
        :ssh_pty,
        :ssh_timeout,
        :ssh_handshake_attempts,
        :ssh_disable_agent,
        :ssh_bastion_host,
        :ssh_bastion_port,
        :ssh_bastion_username,
        :ssh_bastion_password,
        :ssh_bastion_private_key_file,
        :winrm_host,
        :winrm_port,
        :winrm_username,
        :winrm_password,
        :winrm_timeout
      ]
    end
  end
end
