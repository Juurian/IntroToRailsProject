class GiveawaysController < ApplicationController
  def index
    # Fetch the Giveaway records from the database
    @giveaways = Giveaway.all
  end
end
