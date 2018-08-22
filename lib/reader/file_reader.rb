module Readers
  module FileReader
    def self.can_work?(source)
      File.exist?(source)
    end

    def self.read(file)
      File.read(file)
    end
  end
end
