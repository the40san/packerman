module Packerman::Dsl::Node
  extend ActiveSupport::Concern

  def initialize
    @_hash = {}
    @_hash[:type] = type
  end

  def type
    self.class.name.demodulize.underscore
  end

  def method_missing(method, *args)
    @_hash[method] ||= args.first
  end

  def to_hash
    keys = [:type] + self.class.require_keys + self.class.optional_keys
    @_hash.slice(*keys)
  end

  class_methods do
    def require_keys
      []
    end

    def optional_keys
      []
    end
  end
end
