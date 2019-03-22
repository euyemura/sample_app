class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
    # render html: "hello, world"
    render(:html => "why hello there")
    puts "hello this is self, #{self.is_a? ApplicationController}"
    #so self is the ApplicationController object, i dont think its actually the class. yes it's just an instance of ApplicationController
    # see here, really what the original was doing was just calling a method called render, and now i want to output what exactly self is, because thats what render should be being called upon.
  end
end
