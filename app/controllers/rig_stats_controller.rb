class RigStatsController < ApplicationController


  def index
    @stats = RigStat.by_rack
  end


end
