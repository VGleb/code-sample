Rails.application.config.session_store(
  :cookie_store,
  key: '_cs_session',
  domain: ".#{Settings.hostname}",
  expire_after: 2.weeks
)

if Rails.env.test?
  require Rails.root.join('lib', 'session', 'plain_cookie_store')
  Rails.application.config.session_store(PlainCookieStore, key: 'test_session', data_key: 'session_data')
end
