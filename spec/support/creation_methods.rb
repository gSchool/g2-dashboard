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
    :email => 'awesomesauce@example.com',
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

def create_event(new_attributes = {})
  default_attributes =
    {:occurred_on => 89765467,
    :event_type => "User Registered",
    :properties => '{
      "variation" => "a"
    }',
    :api_project_id => "tyfgvhbjk98y7itufghcvbjkoiu9y8ugvh"
  }
  attributes = default_attributes.merge(new_attributes)
  Event.create!(attributes)
end