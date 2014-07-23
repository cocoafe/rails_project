class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.role == "admin"
        can :manage , :all
    elsif user.role == "reporter"
        can [:index, :galaxy, :product_family , :alien_category, :logs] , :chart
    end
  end
end
