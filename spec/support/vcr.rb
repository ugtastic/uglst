def record_mode(mode = ENV['VCR_RECORD_MODE'])
  case mode
  when 'all'  then :all
  when 'new'  then :new_episodes
  when 'once' then :once
  else
    :none
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.ignore_localhost                        = true
  c.default_cassette_options                = { record: record_mode }
  c.allow_http_connections_when_no_cassette = false
  c.configure_rspec_metadata!

  c.ignore_hosts 'codeclimate.com'

  filters = []
  # Github
  filters += %w(GITHUB_ADMIN_USER_PASSWORD GITHUB_CLIENT_ID GITHUB_SECRET)

  # LinkedIn
  filters += %w(LINKEDIN_KEY LINKEDIN_SECRET)

  # Mailgun
  filters += %w(MAILGUN_API_KEY MAILGUN_TOKEN)

  # Mixpanel
  filters += %w(MIXPANEL_API_SECRET MIXPANEL_TOKEN)

  # Twitter
  filters += %w(TWITTER_ACCOUNT_ID TWITTER_CONSUMER_KEY TWITTER_CONSUMER_SECRET TWITTER_OAUTH_SECRET TWITTER_OAUTH_TOKEN)

  # Stripe
  filters += %w(STRIPE_PUBLISHABLE_KEY STRIPE_SECRET_KEY)

  # Akismet
  filters += %w(AKISMET_KEY)

  filters.each do |filter|
    c.filter_sensitive_data("<#{filter}>") { ENV[filter] }
  end
end