require 'json'
require 'nori'

module Cb
  module ResponseValidator
    
    class << self
      def validate(response)
        body = response.response.body rescue nil
        return Hash.new if !body

        if response.code != 200
          return get_empty_json_hash if body.include?('<!DOCTYPE html')
        end
        
        try_parse_json(body) || try_parse_xml(body) || {}
      end

      def get_empty_json_hash
        Hash.new
      end

      private

      def try_parse_json(body)
        begin
          JSON.parse(body)
        rescue JSON::ParserError
          nil
        end
      end

      def try_parse_xml(body)
        begin
          MultiXml.parse(body, KeepRoot: true)
        rescue MultiXml::ParseError
          nil
        end
      end
    end
    
  end
end
