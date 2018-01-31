class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    self.partner = person

    # raise PartnerError if the argument passed into #get_married method is not an instance of Person class
    if person.class != Person
      raise PartnerError
    else
      person.partner = self
    end

  end

  # define a custom error class, PartnerError, that inherits from StandardError
  class PartnerError < StandardError
  end

end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name




# ruby custom_errors.rb

=begin

  Notes
  - get NoMethodError if try to call #get_married method with an argument that is not an instance of the Person class
  - example: beyonce.get_married("Jay-Z") --> "Jay-Z" is a String, NOT an instance of the Person class...
    ...result --> `get_married': undefined method `partner=' for "Jay-Z":String (NoMethodError)

  Where does a Custom Error Class belong?
  - it can be defined inside the Person class
  - it can be defined outside the Person class
  - it can be defined in a module which is then included inside the Person class

  Now when file runs, result is custom error: `get_married': Person::PartnerError (Person::PartnerError)

=end
