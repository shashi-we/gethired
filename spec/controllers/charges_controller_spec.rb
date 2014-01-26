require 'spec_helper'
require 'stripe_mock'
describe ChargesController do
  before { 
  	StripeMock.start 
  	@user = FactoryGirl.create(:user)
    template = FactoryGirl.create(:template)
    completion_day = FactoryGirl.create(:completion_day,:template=>template)
    number_of_page = FactoryGirl.create(:number_of_page,:template=>template)
    color = FactoryGirl.create(:color,:template=>template)
    order = FactoryGirl.create(:order,:user_id=>@user.id,:template_name=>template.name)
    }
  after { StripeMock.stop }
  it "creates a stripe customer" do
    # This doesn't touch stripe's servers nor the internet!
    customer = Stripe::Customer.create({
      email: 'johnny@appleseed.com',
      card: 'void_card_token'
    })
    charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => 125,
	    :description => 'Stripe customer',
	    :currency    => 'usd'
	  )
    expect(customer.email).to eq('johnny@appleseed.com')
  end
  it "mocks a declined card error" do
	  # Prepares an error for the next create charge request
	  StripeMock.prepare_card_error(:card_declined)

	  expect { Stripe::Charge.create }.to raise_error {|e|
	    expect(e).to be_a Stripe::CardError
	    expect(e.http_status).to eq(402)
	    expect(e.code).to eq('card_declined')
	  }
  end
  it "generates a stripe card token" do
	  card_token = StripeMock.generate_card_token(last4: "9191", exp_year: 1984)
	  cus = Stripe::Customer.create(card: card_token)
	  card = cus.cards.data.first
	  expect(card.last4).to eq("9191")
	  expect(card.exp_year).to eq(1984)
  end



end