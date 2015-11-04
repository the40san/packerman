class Packerman::Dsl::Provisioners::ChefSolo < Packerman::Dsl::Provisioners
  def type
    "chef-solo"
  end

  class << self
    def optional_keys
      [
        :chef_environment,
        :config_template,
        :cookbook_paths,
        :data_bags_path,
        :encrypted_data_bag_secret_path,
        :environments_path,
        :execute_command,
        :install_command,
        :json,
        :prevent_sudo,
        :remote_cookbook_paths,
        :roles_path,
        :run_list,
        :skip_install,
        :staging_directory
      ]
    end
  end
end
