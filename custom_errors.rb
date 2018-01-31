class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    self.partner = person

    # raise PartnerError if the argument passed into #get_married method is not an instance of Person class
    if person.class != Person
      begin # 1. if the argument passed into #get_married method is not an instance of Person class, `begin` error handling
        raise PartnerError # 2. `raise` PartnerError
      rescue PartnerError => error # 3. Then `rescue` PartnerError. The `rescue` method creates an instance of the PartnerError class (error)
        puts error.message # 4. The #message method is then called on that instance of the PartnerError class (error.message)
      end
    else
      person.partner = self
    end

  end

  # define a custom error class, PartnerError, that inherits from StandardError
  class PartnerError < StandardError
    # output a custom error message when the error is raised
    def message
      "you must give the get_married method an argument of an instance of the person class!"
    end
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

  Raise a Custom Error
  - Now when the file runs, the result is custom error: `get_married': Person::PartnerError (Person::PartnerError)

  Custom Error Handling
  - The program is still broken and the last line of the file (puts beyonce.name) never gets executed because an error is raised for #get_married method
  - Solution: rescue the raised errors and allow the program to continue to run

    begin
      raise YourCustomError
    rescue YourCustomError
      // do something
    end

  - Now when the file runs, the custom error message is printed out, but the program continues to run & executes the code that follows the #get_married method
    #=> you must give the get_married method an argument of an instance of the person class!
    #=> Beyonce

=end
