Rails.configuration.stripe = {
  :publishable_key => Setting.find_by(account_type: 'stripe').access_key,      
  :secret_key      => Setting.find_by(account_type: 'stripe').secret_access
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]