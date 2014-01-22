Rails.configuration.stripe = {
  :publishable_key => 'pk_test_UHCTGJrledTZplEBOojNgJtc',      
  :secret_key      => 'sk_test_cMMyhLWIJSZs835SbPkd39y6'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]