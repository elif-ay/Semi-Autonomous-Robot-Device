import os
import sys
def runCommand():
	command = "raspivid -o - -t 0 -n -w 640 -h 480 -fps 30 -b 1000000 -fl | cvlc -vvv stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:8090}' :demux=h264"
	os.system(command)
runCommand()
