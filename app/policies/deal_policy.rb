class DealPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(latitude: nil, longitude: nil)
      # scope c'est Deal
      #Deal.where(user: user) => pour afficher que les Deals du owner
    end

    def show?
      true # Tous les users peuvent voir tous les deals
    end

    def create?
      true # Tous les users peuvent créer des deals
    end

    def update?
      # Seul le owner du deal peut le modifier
      # record => @deal
      # user => current_user
      user_is_owner_or_admin?
    end

    def create?
      user_is_owner_or_admin?
    end

    private

    def user_is_owner_or_admin?
      user.admin || record.user == user
    end
  end
end
