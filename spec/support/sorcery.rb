module Sorcery::TestHelpers::Rails::Acceptance
  def sign_in(user)
    data = MultiJson.dump(user_id: user.id)
    header 'Cookie', "test_session=test; session_data=#{data}"
  end
end

RSpec.configure do |config|
  config.include Sorcery::TestHelpers::Rails::Request, type: :request
  config.include Sorcery::TestHelpers::Rails::Acceptance, type: :acceptance
end
