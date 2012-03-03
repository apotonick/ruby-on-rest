require 'test_helper'

class BowlsControllerTest < ActionController::TestCase
  include Roar::Rails::TestCase
  
  test "POST creates bowl with fruits" do
    post :create, "{\"fruits\":[{\"title\":\"Orange\"}]}", :format => :json
    assert_body "{\"title\":\"Orange\",\"links\":[{\"rel\":\"self\",\"href\":\"http://yum.my/fruits/Orange\"}]}"
  end
end
