Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

StripeEvent.configure do |events|
  events.subscribe 'charge.succeeded' do |event|
    # Here you can send notification to user,
    # change transaction state or whatever you want.
  end
end
