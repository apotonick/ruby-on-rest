require 'test_helper'

class FruitsControllerTest < ActionController::TestCase
  include Roar::Rails::TestCase
  
  test "GET returns fruit document" do
    get :show, :id => 1, :format => :json
    assert_body "{\"title\":\"Apple\",\"links\":[{\"rel\":\"self\",\"href\":\"http://yum.my/fruits/Apple\"}]}"
  end
  
  test "POST creates fruit" do
    post :create, "{\"title\":\"Orange\"}", :format => :json
    assert_body "{\"title\":\"Orange\",\"links\":[{\"rel\":\"self\",\"href\":\"http://yum.my/fruits/Orange\"}]}"
  end
end
