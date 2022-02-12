#!/bin/bash
echo PID of shell running this command:
echo $$
echo leaving bash behind and opening xterm if available
exec xterm
echo looks like xterm is not available or opening
