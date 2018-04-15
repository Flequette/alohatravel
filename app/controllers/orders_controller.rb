class OrdersController < ApplicationController
  def create
    booking = Booking.find(params[:booking_id])
    order  = Order.create!(booking_sku: booking.sku, amount: booking.price * 100, state: 'pending', user: current_user, bookid: booking.id)

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end
end
