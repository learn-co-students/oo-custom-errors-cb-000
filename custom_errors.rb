class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    self.partner = person
    person.partner = self
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

  
=end
