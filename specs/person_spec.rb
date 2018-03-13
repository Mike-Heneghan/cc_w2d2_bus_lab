require("minitest/autorun")
require_relative("../person.rb")

class TestPerson < MiniTest::Test

  def setup
    @person1 = Person.new("Joseph",42)
  end

  def test_person_name
    person_name = @person1.name
    assert_equal("Joseph",person_name)
  end

  def test_person_age
    person_age = @person1.age
    assert_equal(42,person_age)
  end

end
