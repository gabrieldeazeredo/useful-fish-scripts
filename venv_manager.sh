#!/usr/bin/fish

#   Gabriel de Azeredo, 06/07/2024

#   Script to manage python virtual enviroments with fish shell.
#   Make sure that python3-pip and fish shell is already installed.

#   To install it, run: ./venv_manager.sh
#   Before use functions, set the virtual enviroments folder path. 

function set_venv_path
    set --universal venv_path $argv
    echo "Virtual environment path defined as $venv_path"
end

function venv_list
    # function to list all virtual environments created.
    ls -l $venv_path
end

function venv_activate
    # function to activate a virtual environments
    # name of environment must be pass by parameter.
    set venv_name $argv
    source $venv_path/$venv_name/bin/activate.fish
end

function venv_create
    # function to create a new virtual environments 
    # name of new environment must be pass by paramenter.
    set venv_name $argv
    echo "Creating $venv_name virtual environment..."

    python3 -m venv $venv_path/$venv_name
end

function venv_remove
    # function to remove a virtual environment.
    set venv_name $argv
    echo "Are you sure to remove $venv_name environment? (Y/n)"

    switch (read)
        case '*'
            rm -r $venv_path/$venv_name
            echo "$venv_name removed."
        case 'n'
            echo "Operation aborted."
    end    
end

funcsave set_venv_path
funcsave venv_list
funcsave venv_create
funcsave venv_activate
funcsave venv_remove