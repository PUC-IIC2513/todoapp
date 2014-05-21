class SessionsController < ApplicationController

  def register
    register!
    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end

end
