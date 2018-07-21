class PlainCookieStore < ActionDispatch::Session::AbstractStore
  attr_reader :data_key

  def initialize(app, options = {})
    @data_key = options[:data_key] || 'session_data'
    super(app, options)
  end

  def find_session(request, session_id)
    session_data = {}
    session_id ||= generate_sid
    session_data = MultiJson.load(request.cookie_jar[data_key]) if request.cookie_jar[data_key]
    [session_id, session_data]
  end

  def write_session(request, session_id, session_data, _options)
    request.cookie_jar[data_key] = MultiJson.dump(session_data)
    session_id
  end

  def delete_session(request, _session_id, _options)
    request.cookie_jar.delete(data_key)
    generate_sid
  end
end
