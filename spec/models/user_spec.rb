require 'spec_helper'

describe User do
  describe "Validations" do
    describe "on a new user" do

      it "should not be valid with a confirmation mismatch" do
        user = User.new(password: 'alpha', password_confirmation: 'beta')
        expect(user).to_not be_valid
      end

    end
  end
end
