shared_context 'response_object' do
  let(:response) do
    double(
      status_code: response_status,
      response_headers: response_headers,
      body: response_body
    )
  end
end
