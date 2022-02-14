#!/bin/bash
cmd="date"
fmt="+%d-%B-%Y"
eval $cmd $fmt; echo $$
#prints date and process id
