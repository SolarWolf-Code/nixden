# show this list
@default:
    just --list 

# rebuild both os and home
@both: os home

# rebuild os
@os:
    nh os switch .

# rebuild home
@home:
    nh home switch .
