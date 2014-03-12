Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
           :assertion_consumer_service_url     => "https://rnr-rails.herokuapp.com/auth/saml/callback",
           :issuer                             => "RnR Test",
           :idp_sso_target_url                 => "https://thoughtworks.oktapreview.com/app/template_saml_2_0/k1w3t2c2INSPQMHOLJIU/sso/saml",
           :idp_cert                           => ENV["IDP_CERT"],
           :name_identifier_format             => "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"

  provider :salesforce, ENV['SALESFORCE_KEY'], ENV['SALESFORCE_SECRET']
  provider OmniAuth::Strategies::SalesforceSandbox,
           ENV['SALESFORCE_SANDBOX_KEY'],
           ENV['SALESFORCE_SANDBOX_SECRET']
end