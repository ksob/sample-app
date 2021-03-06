# frozen_string_literal: true

module CSVImporter
  def self.process(file, model_name)
    SmarterCSV.process(file, chunk_size: 20000) do |chunk|
      records = []
      chunk.each do |row|
        records << eval("#{model_name}.new(row)")
      end

      eval("#{model_name}.send :import, records, on_duplicate_key_ignore: true, validate: false")
    end
  end
end
