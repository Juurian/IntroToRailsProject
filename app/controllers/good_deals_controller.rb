class GoodDealsController < ApplicationController
  def index
    @good_deals = GoodDeal.all
  end
end
