# frozen_string_literal: true

# Adapter is a structural design pattern that allows objects with incompatible interfaces to collaborate.
#
# @see https://refactoring.guru/design-patterns/adapter
class XmlClient
  def initialize(xml)
    @xml = xml
  end
end

class XmlToJsonAdapter < XmlClient
  def initialize(xml)
    super(xml)
    @json_service = JsonService.new
  end

  def execute
    # this doesn't quite work, but you get the idea; Nokogiri would be a better choice for doing this
    json = @xml.tr('<', '{').tr('>', '}').tr('/', ':')
    @json_service.execute(json)
  end
end

class JsonService
  def execute(json)
    puts "JSON: #{json}"
  end
end

xml = XmlToJsonAdapter.new('<xml>test</xml>')
xml.execute
