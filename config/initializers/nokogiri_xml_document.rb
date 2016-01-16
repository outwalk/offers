module Nokogiri
  module XML
    class Document
      def get(*args)
        at(*args).try(:text)
      end
    end
  end
end
