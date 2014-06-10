def create_project(new_attributes = {})
  default_attributes = {
    :project_name => 'Murder Joffrey',
    :project_api => SecureRandom.uuid
  }
  attributes = default_attributes.merge(new_attributes)
  Project.create!(attributes)
end

def create_user(new_attributes = {})
  default_attributes = {
    :first_name => 'Arya',
    :last_name => 'Stark',
    :email => "awesomesauce#{rand}@example.com",
    :password => 'yepperz',
    :password_confirmation => 'yepperz'
  }
  attributes = default_attributes.merge(new_attributes)
  User.create!(attributes)
end

def create_membership(new_attributes = {})
  default_attributes = {
    :user_id => create_user.id,
    :project_id => create_project.id
  }
  attributes = default_attributes.merge(new_attributes)
  Membership.create!(attributes)
end

def new_event(attributes = {})
    default_attributes = {
      :occurred_on => Time.now,
      :user_id => "1",
      :event_type => "User Registered",
      :properties => {
        :variation => "a",
        :hello => "b"
      },
      :project_id => "1"
    }
  Event.new(default_attributes.merge(attributes))
end

def create_event(attributes = {})
  event = new_event(attributes)
  event.save!
  event
end

