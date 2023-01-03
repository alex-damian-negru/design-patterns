# frozen_string_literal: true

# Adapter is a structural design pattern that allows objects with incompatible interfaces to collaborate.

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
