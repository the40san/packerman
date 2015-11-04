class Packerman::Dsl::Provisioners::Shell < Packerman::Dsl::Provisioners
  include Packerman::Dsl::Node

  class << self
    def require_keys
      [
        # Exactly one of the following is required
        :inline,
        :script,
        :scripts
      ]
    end

    def optional_keys
      [
        :binary,
        :environment_vars,
        :execute_command,
        :inline_shebang,
        :remote_path,
        :start_retry_timeout
      ]
    end
  end
end
