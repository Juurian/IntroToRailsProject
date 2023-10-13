class GiveawaysController < ApplicationController
  def index
    @giveaways = Giveaway.all

    # Search functionality
    @giveaways = @giveaways.where("title LIKE ?", "%#{params[:search]}%") if params[:search]

    # Pagination
    @giveaways = @giveaways.paginate(page: params[:page], per_page: 18)
  end

  def show
    @giveaways = Giveaway.find(params[:id])
  end
end
