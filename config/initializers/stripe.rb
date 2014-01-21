Rails.configuration.stripe = {
  :publishable_key => Setting.where(:account_type=>'stripe').first.access_key,
  :secret_key      => Setting.where(:account_type=>'stripe').first.secret_access
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]