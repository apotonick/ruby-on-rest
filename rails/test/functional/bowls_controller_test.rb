require 'test_helper'

class BowlsControllerTest < ActionController::TestCase
  include Roar::Rails::TestCase
  
  test "GET returns bowl document" do
    get :show, :id => 1, :format => :json
    assert_body "{\"fruits\":[],\"links\":[{\"rel\":\"self\",\"href\":\"http://bowls/1\"}]}"
  end
  
  test "POST creates bowl with fruits" do
    post :create, "{\"fruits\":[{\"title\":\"Orange\"}]}", :format => :json
    bowl = Bowl.find(:last)
    assert_body "{\"fruits\":[{\"title\":\"Orange\",\"links\":[{\"rel\":\"self\",\"href\":\"http://yum.my/fruits/Orange\"}]}],\"links\":[{\"rel\":\"self\",\"href\":\"http://bowls/#{bowl.id}\"}]}"
  end
end
