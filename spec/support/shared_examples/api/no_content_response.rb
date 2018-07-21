RSpec.shared_examples 'no content response' do |name = 'Got 204'|
  example_request name do
    expect(status).to eq(204)
  end
end
