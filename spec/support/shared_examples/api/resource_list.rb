RSpec.shared_examples 'resource list' do |size:|
  context 'with specified limit', document: false do
    let(:limit) { 1 }

    example_request 'List with 1 item' do
      expect(status).to eq(200)
      expect_json_sizes(data: limit)
      expect_json('meta', limit: limit)
    end
  end

  context 'with specified offset', document: false do
    let(:offset) { 1 }
    let(:limit) { size }

    example_request 'List with offset' do
      expect(status).to eq(200)
      expect_json('meta', offset: offset)
      expect_json_sizes(data: size - offset)
    end
  end

  example_request 'List' do
    expect(status).to eq(200)
    expect_json_types(data: :array_of_objects)
    expect_json_sizes(data: size)
    expect_json('meta', total: size)
  end
end
