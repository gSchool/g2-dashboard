require 'spec_helper'

describe User do
  describe "Validations" do
    describe "on a new user" do
      it "should not be valid with a confirmation mismatch" do
        user = User.new(password: 'alpha', password_confirmation: 'beta')
        user.save
        expect(user.errors[:password_confirmation]).to match_array ["doesn't match Password"]
      end

      it "should not be valid without an email" do
        user = User.new(email: "")
        user.save
        expect(user.errors[:email]).to match_array ["can't be blank"]
      end
    end
  end
end
