RSpec.shared_examples 'unauthorized response' do |name = 'Got 401'|
  example_request name do
    expect(status).to eq(401)
  end
end
