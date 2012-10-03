require 'spec_helper'

describe UserController do

  describe "GET 'signup'" do
    it "returns http success" do
      get 'signup'
      response.should be_success
    end
  end

  describe "GET 'signin'" do
    it "returns http success" do
      get 'signin'
      response.should be_success
    end
  end

  describe "GET 'signout'" do
    it "returns http success" do
      get 'signout'
      response.should be_success
    end
  end

end
