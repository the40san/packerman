class Packerman::Dsl::Builders::VirtualboxIso < Packerman::Dsl::Builders
  def type
    "virtualbox-iso"
  end

  class << self
    def require_keys
      [
        :iso_checksum,
        :iso_checksum_type,
        :iso_url,
        :ssh_username,
        :ssh_password
      ]
    end

    def optional_keys
      [
        :boot_command,
        :boot_wait,
        :disk_size,
        :export_opts,
        :floppy_files,
        :format,
        :guest_additions_mode,
        :guest_additions_path,
        :guest_additions_sha256,
        :guest_additions_url,
        :guest_os_type,
        :hard_drive_interface,
        :headless,
        :http_directory,
        :http_port_min,
        :http_port_max,
        :iso_interface,
        :iso_urls,
        :output_directory,
        :shutdown_command,
        :shutdown_timeout,
        :ssh_host_port_min,
        :ssh_host_port_max,
        :ssh_skip_nat_mapping,
        :vboxmanage,
        :vboxmanage_post,
        :virtualbox_version_file,
        :vm_name
      ]
    end
  end
end
