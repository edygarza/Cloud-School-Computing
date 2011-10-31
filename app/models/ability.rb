class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.admin?
      can :manage, :all
    elsif user.director?
      can :create, User
      can :manage, User do |u|
	u == user || u.school.owner == user
      end
      can :create, School
      can :manage, School do |s|
	s.owner == user
      end
      can :create, Student
      can :manage, Student do |s|
    	s.school.owner == user
      end
      can :create, Subject
      can :manage, Subject do |s| 
	s.school.owner == user
      end
      can :manage, Group do |g|
	g.school.owner == user
      end
      can [:new,:create], Group
      can :create, GroupStudent
      can :manage, GroupStudent do |gs|
        gs.group.school.owner == user
      end
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
