class AccessPolicy
  include AccessGranted::Policy

  def configure
    # For more details check the README at

    # https://github.com/chaps-io/access-granted/blob/master/README.md

    # Roles inherit from less important roles, so:
    # - :admin has permissions defined in :tutor, :user and himself
    # - :tutor has permissions from :user and himself
    # - :user has only its own permissions since it's the first role.

    # The most important role should be at the top.
    # In this case a super administrator & admin.
    role :superadmin, proc { |user| user.is_superadmin? } do
      can :manage, User
      can :manage, Course
      can :manage, Playlist
      can :manage, Video
      can :manage, Photo
      can :manage, Role
    end

    role :admin, proc { |user| user.is_admin? } do
      can :manage, User
      can :manage, Course
    end

    # More privileged role, applies to tutor.
    role :tutor, proc { |user| user.is_tutor? } do
      can :create, Course
      can :create, Playlist
      can :create, Video
      can :create, Photo
      can [:update, :destroy], Course do |course, user|
        course.user_id == user.id
      end
      can [:update, :destroy], Playlist do |playlist, user|
        playlist.user_id == user.id
      end
      can [:update, :destroy], Video do |video, user|
        video.user_id == user.id
      end
      can [:update, :destroy], Photo do |photo, user|
        photo.user_id == user.id
      end
    end

    role :viewer do
      can :read, Course do |course, user|
        user.is_able_to_view?(course)
      end
      can :read, Playlist do |playlist, user|
        user.is_able_to_view?(playlist)
      end
      can :read, Video do |video, user|
        user.is_able_to_view?(video)
      end
      can :read, Photo do |photo, user|
        user.is_able_to_view?(photo)
      end
    end

    # The base role with no additional conditions.
    # Applies to every user.
    role :default do
      can :read, Course do |course|
        course.is_free?
      end
      can :create, Playlist do |playlist|
        playlist.is_free?
      end
      can :create, Video do |video|
        video.is_free?
      end
      can :create, Photo do |photo|
        photo.is_free?
      end
    end
  end
end
