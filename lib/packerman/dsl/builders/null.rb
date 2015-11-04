class Packerman::Dsl::Builders::Null < Packerman::Dsl::Builders
  def type
    "null"
  end

  class << self
    def require_keys
      []
    end

    def optional_keys
      []
    end
  end
end
