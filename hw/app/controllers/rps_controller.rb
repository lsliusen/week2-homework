class RpsController < ApplicationController
    def index
        @gestures = gestures_list
    end

    def display
        gestures = gestures_list
        pgindex = params["gesture"].to_i
        cgindex = [0,1,2].sample
        @pgesture = gestures[pgindex]
        @cgesture = gestures[cgindex]
        @result = results[get_result(pgindex,cgindex)]
    end

    def gestures_list
        return ["Rock", "Paper", "Scissors"]
    end

    def results
        return ["Congratulations, you win!", "You lose!", "It's a tie!"]
    end

    def get_result (pgi, cgi)
        if pgi == cgi
            return 2
        elsif pgi == cgi + 1 || pgi == cgi - 2
            return 0
        else
            return 1
        end
    end
    
end

