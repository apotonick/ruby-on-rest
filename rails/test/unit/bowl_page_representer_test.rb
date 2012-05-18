require 'test_helper'

class BowlPageRepresenterTest < ActiveSupport::TestCase
  setup do
    @bowl = Bowl.find(1)
    @bowl.fruits = Fruit.find(:all)
  end
  
  test "page 1 contains link to next" do
    @page = @bowl.fruits.paginate(:page => 1, :per_page => 2)
    
    assert_equal "{\"total_entries\":5,\"links\":[{\"rel\":\"self\",\"href\":\"http://y/bowls/1?page=1\"},{\"rel\":\"next\",\"href\":\"http://y/bowls/1?page=2\"}],\"items\":[{\"title\":\"Apple\",\"links\":[{\"rel\":\"self\",\"href\":\"http://y/fruits/Apple\"}]},{\"title\":\"Orange\",\"links\":[{\"rel\":\"self\",\"href\":\"http://y/fruits/Orange\"}]}]}", @page.extend(BowlPageRepresenter).to_json(:model => @bowl)
  end
  
  test "page 2 contains link to next and previous" do
    @page = @bowl.fruits.paginate(:page => 2, :per_page => 2)
    
    assert_equal "{\"total_entries\":5,\"links\":[{\"rel\":\"self\",\"href\":\"http://y/bowls/1?page=2\"},{\"rel\":\"next\",\"href\":\"http://y/bowls/1?page=3\"},{\"rel\":\"previous\",\"href\":\"http://y/bowls/1?page=1\"}],\"items\":[{\"title\":\"Banana\",\"links\":[{\"rel\":\"self\",\"href\":\"http://y/fruits/Banana\"}]},{\"title\":\"Mango\",\"links\":[{\"rel\":\"self\",\"href\":\"http://y/fruits/Mango\"}]}]}", @page.extend(BowlPageRepresenter).to_json(:model => @bowl)
  end
  
  test "page 3 contains link to next" do
    @page = @bowl.fruits.paginate(:page => 3, :per_page => 2)
    
    assert_equal "{\"total_entries\":5,\"links\":[{\"rel\":\"self\",\"href\":\"http://y/bowls/1?page=3\"},{\"rel\":\"previous\",\"href\":\"http://y/bowls/1?page=2\"}],\"items\":[{\"title\":\"Cherry\",\"links\":[{\"rel\":\"self\",\"href\":\"http://y/fruits/Cherry\"}]}]}", @page.extend(BowlPageRepresenter).to_json(:model => @bowl)
  end
end
