class Packerman::Dsl
  class << self
    def register(type: "", &block)
      product = to_subclass(type).new
      product.instance_eval(&block)
      register_to_repo(product.to_hash)
    end

    def register_to_repo(product)
      Packerman::Repository.instance.send("add_#{name.demodulize.underscore}", product)
    end

    def to_subclass(type)
      "#{name}/#{type}".underscore.camelize.constantize
    end
  end
end
