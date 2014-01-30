
stripe = YAML.load(File.read(Rails.root.join("config", "stripe.yml")))[Rails.env]
Stripe.api_key = stripe["api_key"]
STRIPE_PUBLIC_KEY = stripe["public_key"]