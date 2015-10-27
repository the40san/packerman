class Packerman::Dsl::Variables < Packerman::Dsl
  def initialize
    @_hash = {}
  end

  def method_missing(method, *args)
    @_hash[method] ||= args.first
  end

  def to_hash
    @_hash
  end
end
