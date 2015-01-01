class InvitesController < ApplicationController
  def index
      @contacts = request.env['omnicontacts.contacts']
      puts @contacts
  end

  def failure
    p "Faild"
  end
end
