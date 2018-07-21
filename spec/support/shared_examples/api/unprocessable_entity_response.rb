RSpec.shared_examples 'unprocessable entity response' do |name = 'Got 422'|
  example_request name do
    expect(status).to eq(422)
  end
end
