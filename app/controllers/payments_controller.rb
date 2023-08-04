# frozen_string_literal: true

class PaymentsController < ApplicationController
    def new
    end
    
    def create
      customer = Stripe::Customer.create(
        {
          :email => params[:stripeEmail],
          :source => params[:stripeToken]

        }
      )

      
      payment_method = Stripe::PaymentMethod.create({
          type: 'card',
          card: {
            number: params[:number],
            exp_month: params[:exp_month],
            exp_year: params[:exp_year],
            cvc: params[:cvc],
          },
        })


      charge = Stripe::PaymentIntent.create({
        :customer => customer.id,
        :amount => 500,
        :description => 'Rails Stripe transaction',
        :currency => 'inr',
      })
    
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_payment_path
    
    end
    def set_params
      params.permit( :stripeToken, :stripeTokenType, :stripeEmail, :number, :exp_month, :exp_year, :cvc)
    end
  end
