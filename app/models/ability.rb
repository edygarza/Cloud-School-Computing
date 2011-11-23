class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.admin?
      can :manage, :all
    elsif user.director?
      package = user.package

      users = 0
      School.find(:all, :conditions => { :owner_id => user.id }).each do |school|
        users = users + school.users.count
      end
      can [:create,:new], User if package.users_limit > users
      can [:index,:read,:show,:edit,:update,:destroy,:more], User do |u|
	u == user || u.school.owner == user
      end

      can [:create,:new], School
      can :manage, School do |s|
	s.owner == user
      end

      students = 0
      School.find(:all, :conditions => { :owner_id => user.id }).each do |school|
        students = students + school.students.count
      end
      can [:create,:new], Student if package.students_limit > students
      can [:index,:read,:show,:edit,:update,:destroy], Student do |s|
    	s.school.owner == user
      end

      subjects = 0
      School.find(:all, :conditions => { :owner_id => user.id }).each do |school|
        subjects = subjects + school.subjects.count
      end
      can [:create,:new], Subject if package.subjects_limit > subjects
      can [:index,:read,:show,:edit,:update,:destroy], Subject do |s| 
	s.school.owner == user
      end

      groups = 0
      School.find(:all, :conditions => { :owner_id => user.id }).each do |school|
        groups = groups + school.groups.count
      end
      can [:create,:new], Group if package.groups_limit > groups
      can [:index,:read,:show,:edit,:update,:destroy], Group do |g|
	g.school.owner == user
      end
   
      can :create, GroupStudent
      can :manage, GroupStudent do |gs|
        gs.group.school.owner == user
      end
      can :create, Activity
      can :manage, Activity do |a|
	a.group.school.owner == user
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
