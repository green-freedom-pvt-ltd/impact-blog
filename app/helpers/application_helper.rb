module ApplicationHelper
  def mobile_hide
    params[:android].to_i == 1
  end
end
