# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.secretary?
      can %i[read create update destroy], LocalAuthority
      can %i[read create update destroy], Broadcast
      can %i[read create], Event
      can %i[update destroy], Event, user_id: user.id
      can %i[read create], Business
      can %i[update destroy], Business, user_id: user.id
      can :read, BusinessProduct
      can :create, BusinessProduct if Business.exists?(owner_username: user.username)
      can %i[update destroy], BusinessProduct, business: { owner_username: user.username }
      can :read, Suggestion
      can %i[read create], Review
      can %i[update destroy], Review, user_id: user.id
      can %i[read create], Comment
      can %i[update destroy], Comment, user_id: user.id

    end

    return unless user.society_member?

    can :read, LocalAuthority
    can :send_sos, LocalAuthority
    can :read, Broadcast
    can %i[read create], Event
    can %i[update destroy], Event, user_id: user.id
    can [:read], Business
    can %i[update destroy], Business, user_id: user.id
    can :read, BusinessProduct
    can :create, BusinessProduct if Business.exists?(owner_username: user.username)
    can %i[update destroy], BusinessProduct, business: { owner_username: user.username }
    can :create, Suggestion
    can %i[read create], Review
    can %i[update destroy], Review, user_id: user.id
    can %i[read create], Comment
    can %i[update destroy], Comment, user_id: user.id
  end
end
