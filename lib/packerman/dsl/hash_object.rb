class Packerman::Dsl::HashObject < Packerman::Dsl
  include Packerman::Dsl::Node
  class << self
    def register_to_repo(product)
      product
    end

    def to_subclass(_type)
      self
    end

    def hash_key
      require_keys + optional_keys
    end

    def inherited(klass)
      Packerman::Dsl.const_set(klass.name.demodulize, klass)
    end
  end
end
