class Role < ActiveRecord::Base
  has_many :users

  def user?
    name=="user"
  end

  def admin?
    name=="admin"
  end
end
