require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  config.response_body_formatter = lambda { |_response_content_type, response_body|
    MultiJson.dump(MultiJson.load(response_body), pretty: true)
  }
  config.api_name += ' (select version in subfolder)'
  config.filter = :public
  config.define_group :v1 do |group|
    group.api_name = 'API Documentation - V1'
    group.filter = :v1
  end
end
