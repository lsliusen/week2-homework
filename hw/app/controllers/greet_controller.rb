class GreetController < ApplicationController
    def index
        @message = params["salutation"]
        if @message == nil
            @message = 'Hello'
        end
    end
end

