class ContactController < ApplicationController
    def index
        
    end

    def submit
        @fname = params["fname"]
        @lname = params["lname"]
    end

    
end

