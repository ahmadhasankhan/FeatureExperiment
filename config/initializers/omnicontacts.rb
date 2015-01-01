require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "486714712283-cqkdjpq0931ec6c5aaj72fd993a2bpug.apps.googleusercontent.com", "9MqhyawVZWoIH-nIVf8_MERL", {:redirect_path => "/oauth2callback", :ssl_ca_file => "/etc/ssl/certs/curl-ca-bundle.crt"}
  #importer :yahoo, "consumer_id", "consumer_secret", {:callback_path => '/callback'}
  #importer :hotmail, "client_id", "client_secret"
  importer :facebook, "338917966269862", "42d70ce85d27725412b489514e082f17"


  # if Rails.env.production?
  #   provider :facebook, '100496163467808', 'f54089826a14131de9b80508c48037f6', :authorize_params => {:display => 'popup'}
  # else
  #   provider :facebook, '338917966269862', '42d70ce85d27725412b489514e082f17'
  # end
  # provider :linkedin, '751wg50gpk0oo3', '8Qz6RDuN8Vg9p1b9'
  # provider :google_oauth2, '729366969862-4t71ok17vli3to1qpcj8kvch64rtjnh2.apps.googleusercontent.com', 'XWRgp883okdZsIkR7KUx8NYN'


end