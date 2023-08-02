# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new 
    if user.secretary?
      can [:read, :create, :update, :destroy], LocalAuthority
      can [:read, :create, :update, :destroy], Broadcast
      can [:read, :create], Event
      can [:update, :destroy], Event, user_id: user.id
      can [:read, :create], Business
      can [:update, :destroy], Business, user_id: user.id
      can :read, BusinessProduct
      can :create, BusinessProduct if Business.exists?(owner_username: user.username)
      can [:update, :destroy], BusinessProduct, business: { owner_username: user.username }
      

    end

    if user.society_member?
      can :read, LocalAuthority
      can :send_sos,LocalAuthority
      can :read, Broadcast
      can [:read], Business
      can [:update, :destroy], Business, user_id: user.id
      can :read, BusinessProduct     
      can :create, BusinessProduct if Business.exists?(owner_username: user.username)
      can [:update, :destroy], BusinessProduct, business: { owner_username: user.username }

    end

  end
end
