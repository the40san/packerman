class Packerman::Dsl::Builders::Docker < Packerman::Dsl::Builders
  include Packerman::Dsl::Node

  class << self
    def require_keys
      [
        #You must specify (only) one of commit, discard, or export_path.
        :commit,
        :discard,
        :export_path,
        :image
      ]
    end

    def optional_keys
      [
        :login,
        :login_email,
        :login_username,
        :login_password,
        :login_server,
        :pull,
        :run_command,
        :volumes
      ]
    end
  end
end
