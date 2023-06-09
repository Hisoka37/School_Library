require_relative 'person'

# The Teacher class represents a teacher, inheriting from the Person class.
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
