class Role < ActiveRecord::Base

  def admin?
    name == "admin"
  end

  def user?
    name == "user"
  end

end
