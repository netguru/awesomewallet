Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '73a3698de16e3be8c6d0', '2a03ca8180e5655d48395304b15f8abe34b84d67'
  provider :google_oauth2, "1001644837540.apps.googleusercontent.com","Vhfdr24B3SJFFgKbt-3lmZCk"
end
