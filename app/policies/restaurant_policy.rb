class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # the class itself -> Restaurant
      scope.all # Restaurant.all
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    # @user => current_user
    # @record => @restaurant
    @user == @record.user || @user.admin
  end

  def destroy?
    @user == @record.user || @user.admin # update?
  end
end
