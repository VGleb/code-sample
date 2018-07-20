RSpec.shared_examples 'failure validator if' do |hash|
  it 'failure' do
    params.merge!(hash)

    result = subject.validate

    expect(result.failure?).to be(true)
  end
end
