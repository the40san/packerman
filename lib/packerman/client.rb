class Packerman::Client
  def convert(file)
    basename = File.basename(file, ".*")
    puts "converting #{file} to #{basename}.json ..."

    template = File.open(file).read
    File.open("#{basename}.json", "w") do |f|
      f.write to_json(template)
    end
    puts "converted!"
  end

  private

  def to_json(template)
    converted_hash = Packerman::Evaluator.new.evaluate(template)
    JSON.pretty_generate(converted_hash)
  end
end
