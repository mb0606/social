class UserFriendship < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'


  attr_accessible :user, :friend, :user_id, :friend_id

  state_machine :state, initial: :pending do
    after_transition on: :accept, do: :send_acceptance_email
 
    state :requested
 
    event :accept do
       transition any => :accepted
    end
  end




  end


  def send_request_email
  	UserNotifier.friend_requested(id).deliver

  end

  def pending_friends
  end

end
