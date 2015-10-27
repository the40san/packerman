class Packerman::Repository
  ARRAY_ATTRIBUTES = [:builders, :provisioners]

  def initialize
    @_repo = {}
  end

  ARRAY_ATTRIBUTES.each do |attr|
    define_method "add_#{attr}" do |hash|
      @_repo[attr] ||= []
      @_repo[attr] << hash
      hash
    end
  end

  def to_hash
    @_repo
  end

  class << self
    def gather
      yield
      @_current_instance.to_hash.tap do
        @_current_instance = nil
      end
    end

    def instance
      @_current_instance ||= new
    end
  end
end
