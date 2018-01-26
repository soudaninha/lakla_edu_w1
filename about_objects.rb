require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object
    # 모든 것은 객체
    assert_equal true, 1.is_a?(Object)
    assert_equal true, 1.5.is_a?(Object)
    assert_equal true, "string".is_a?(Object)
    assert_equal true, nil.is_a?(Object)
    assert_equal true, Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings
    assert_equal "123", 123.to_s
    assert_equal "", nil.to_s
    # to_s is converting something to a string, in whatever way makes the most sense for a given class, it can vary.
    # Sometimes it's what might make sense to display to the user (rather than a developer).
    # Sometimes it's something else. It may or may not be useful for a given class,
    # you just have to look at docs or try and see what it does.
  end

  def test_objects_can_be_inspected
    assert_equal "123", 123.inspect
    assert_equal "nil", nil.inspect
    #inspect is always a sort of developers's debugging output of something to see what it is.
  end

  def test_every_object_has_an_id
    obj = Object.new
    assert_equal Integer, obj.object_id.class
    # 모든 객체의 객체 ID는 정수값이다??
  end

  def test_every_object_has_different_id
    obj = Object.new
    another_obj = Object.new
    assert_equal true, obj.object_id != another_obj.object_id
  end

  def test_small_integers_have_fixed_ids
    assert_equal 1, 0.object_id
    assert_equal 3, 1.object_id
    assert_equal 5, 2.object_id
    assert_equal 201, 100.object_id
    
    # 2x+1

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    assert_equal true, obj           != copy
    assert_equal true, obj.object_id != copy.object_id
  end
end
