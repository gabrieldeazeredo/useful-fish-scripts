#!/usr/bin/fish

function cowboy_greetings

    set quotes "SEE YOU SPACE COWBOY..." "SEE YOU SPACE COWGIRL, SOMEDAY, SOMEWHERE!" "ARE YOU LIVING IN THE REAL WORLD?" "EASY COME, EASY GO..." "YOU'RE GONNA CARRY THAT WEIGHT."
    set_color brblue
    echo (random choice $quotes)
end

funcsave cowboy_greetings