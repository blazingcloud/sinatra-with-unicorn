require 'spec_helper'
describe Site do
  def app
    app_instance  = Site.prepare_instance
  end

  context "get /" do
    before do
      get "/"
    end

    it "sets @title" do
      app.instance_variable_get("@title").should_not be_nil
    end

    it "is ok" do
      last_response.should be_ok
    end

  end
end

