require 'spec_helper'

describe Event do
  describe 'Validations' do

    it 'requires occurred_on to be an integer' do
      event = create_event
      time = Time.now
      expect(event.occurred_on.to_i).to eq time.to_i
    end
    it 'will not validate an improper date' do

      event = new_event(:occurred_on => "wtf")
      expect(event).to have(1).error_on(:occurred_on)
p event.project_id
    end

  end
end