module TweetsHelper
  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    unless signed_in?
      redirect_to "/auth/twitter"
    end
  end
end
