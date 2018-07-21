resource 'Session', document: :v1 do
  include_context 'headers'
  include_context 'response_object'

  get '/api/v1/session/' do
    context 'when user is authenticated' do
      let(:user) { create(:user, :without_relationships) }

      before { sign_in(user) }

      example_request 'Get user info' do
        expect(status).to eq(200)
        expect_json_types(data: :object)
        expect_json('data', email: user.email)
      end
    end

    context 'when user is not authenticated', document: false do
      it_behaves_like 'unauthorized response'
    end
  end

  post '/api/v1/session/' do
    context 'when user exists' do
      let(:user) { create(:user, :without_relationships) }
      let(:raw_post) { pretty_json(data: {email: user.email, password: 'ABC123abc'}) }

      example_request 'Login' do
        expect(status).to eq(201)
        expect_json_types(data: :object)
        expect_json('data', email: user.email)
      end
    end

    context 'when user does not exists', document: false do
      let(:raw_post) { pretty_json(data: {email: 'no@no.no', password: 'no'}) }

      it_behaves_like 'unprocessable entity response'
    end
  end

  delete '/api/v1/session/' do
    context 'when user is authenticated' do
      let(:user) { create(:user, :without_relationships) }

      before { sign_in(user) }

      it_behaves_like 'no content response', 'Logout'
    end

    context 'when user is not authenticated', document: false do
      it_behaves_like 'unauthorized response'
    end
  end
end
