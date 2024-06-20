#!/bin/bash

img=(`find ~/walls/ -name '*' -exec file {} \; | grep -o -P '^.+: \w+ image' | cut -d':' -f1`)
feh --bg-scale "${img[$RANDOM % ${#img[@]} ]}"
