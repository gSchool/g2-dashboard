require 'spec_helper'

describe User do
  describe "Validations" do
    describe "on a new user" do
      it "should not be valid with a blank password" do
        user = User.new(password: '')
        user.save
        expect(user.errors[:password]).to match_array ["can't be blank"]
      end

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

      it "should not be valid with a currently registered email" do
        User.create!(email: "me@me.com", password: "iluvunicorns", password_confirmation: "iluvunicorns")
        user = User.new(email: "me@me.com")
        user.save
        expect(user.errors[:email]).to match_array ["has already been taken"]
      end
    end
  end
end
