class DiceController < ApplicationController
    def index
    end

    def roll
        @roll1 = [1,2,3,4,5,6].sample
        @roll2 = [1,2,3,4,5,6].sample

        is_first_roll = params["point"] == nil
        sum = @roll1 + @roll2

        if is_first_roll
            goal = sum
        else
            goal = params["point"]
        end

        first_win = is_first_roll && (sum == 7 || sum == 11)
        first_lose = is_first_roll && (sum == 2 || sum == 3 || sum == 12)
        goal_win = !is_first_roll && sum == params["point"].to_i
        goal_lose = !is_first_roll && sum == 7

        if first_win or goal_win
            @message = "YOU WIN!"
            @link = "/dice"
            @button = "Start Over"
        elsif first_lose or goal_lose
            @message = "YOU LOSE."
            @link = "/dice"
            @button = "Start Over"
        else
            @link = "/dice/roll?point=#{goal}"
            if is_first_roll
                @message = "Your goal is now #{goal}. Now try to get #{goal} again before you roll a 7."
                @button = "Roll the dice"
            else
                @message = "Your goal is #{goal} but you rolled #{sum}. You can roll again."
                @button = "Roll again."
            end
        end

    end

end

