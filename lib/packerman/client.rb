class Packerman::Client
  def convert(template)
    converted_hash = Packerman::Evaluator.new.evaluate(template)
    JSON.pretty_generate(converted_hash)
  end
end
