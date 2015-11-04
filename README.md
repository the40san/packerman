[![Code Climate](https://codeclimate.com/github/the40san/packerman/badges/gpa.svg)](https://codeclimate.com/github/the40san/packerman)
[![Test Coverage](https://codeclimate.com/github/the40san/packerman/badges/coverage.svg)](https://codeclimate.com/github/the40san/packerman/coverage)

# packerman
Ruby DSL for Packer by HashiCorp.

# Usage

Packerman is converter ruby DSL to Packer template.<br>
Currently, Packerman is supporting these template structures.

### Builders
* amazon-ebs
* amazon-instance
* amazon-chroot
* docker

### Provisioners
* shell
* chef-solo

### Variables
* variables are also supported

# DSL

Here is DSL sample.

```rb:sample.rb
Builders type: "docker" do
  image "centos"
  export_path "image.tar"
end

Provisioners type: "shell" do
  inline ['echo Hello Packerman']
end
```

then, use this command to convert DSL.

```
$ bundle exec packerman <filename>
```

```json:sample.json
{
  "builders": [
    {
      "type": "docker",
      "export_path": "image.tar",
      "image": "centos"
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "echo Hello Packerman"
      ]
    }
  ]
}
```

## Installation
add this line to your Gemfile

```
gem 'packerman'
```

then

```
$ bundle install
```

## Contributing

1. Fork it ( https://github.com/the40san/packerman/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Welcome :)
