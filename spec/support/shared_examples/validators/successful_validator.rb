RSpec.shared_examples 'successful validator' do
  it 'success' do
    result = subject.validate

    expect(result.success?).to be(true)
  end
end
