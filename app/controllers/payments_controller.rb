class PaymentsController < ApplicationController
  def index
    params[:q] ||= Hash.new.merge(created_at_casted_eq: Date.today)
    @date_of_query = params[:q][:created_at_casted_eq]
    @q = Payment.search(params[:q])
    @payments = @q.result(distinct: true)
  end
end