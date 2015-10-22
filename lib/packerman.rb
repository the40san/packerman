require 'active_support'
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/json'

require 'singleton'
require 'packerman/version'
require 'packerman/repository'
require 'packerman/client'
require 'packerman/evaluator'
require 'packerman/dsl'
require 'packerman/dsl/node'
require 'packerman/dsl/hash_object'
require 'packerman/dsl/builders'
require 'packerman/dsl/builders/amazon_ebs'
require 'packerman/dsl/builders/amazon_instance'
require 'packerman/dsl/builders/amazon_chroot'
require 'packerman/dsl/builders/docker'
require 'packerman/dsl/provisioners'
require 'packerman/dsl/provisioners/shell'

module Packerman
end
