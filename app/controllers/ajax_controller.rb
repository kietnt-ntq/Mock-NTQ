class AjaxController < ApplicationController
  def getemail
    @email = User.where("email LIKE ?", "%#{params[:email]}%")
  end
end
