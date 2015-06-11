Rails.application.config.middleware.use OmniAuth::Builder do
    #provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
    provider OmniAuth::Strategies::GoogleOauth2, "135394235706-sq31s4kgjbbmrn8rq4qdnmuftch0t5n8.apps.googleusercontent.com", "kgAq_xJAoT-B90ss8QT68m8t"
end
