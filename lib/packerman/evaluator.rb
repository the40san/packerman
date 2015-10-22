class Packerman::Evaluator
  def evaluate(template)
    Packerman::Repository.gather do
      instance_eval(on_packerman(template))
    end
  end

  private

  def on_packerman(template)
    <<-EOS
      class Packerman::Dsl
        #{parse(template)}
      end
    EOS
  end

  def parse(template)
    template.gsub("Builders", "Builders.register")
  end
end
