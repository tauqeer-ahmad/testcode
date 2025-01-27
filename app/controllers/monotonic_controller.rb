class MonotonicController < ApplicationController
  def index
    # If a parameter :x is present, compute the result
    if params[:x].present?
      x_value = params[:x].to_i
      @result = MonotonicCounter.new.total_inc_dec(x_value)
    end
  end
end
