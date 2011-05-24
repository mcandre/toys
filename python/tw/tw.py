#!/usr/bin/env python

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="17 Jun 2007 - 28 Jun 2007"
__copyright__="Copyright 2007 Andrew Pennebaker"
__version__="0.0.1"
__credits__="Based on tweetyPy (http://muffinresearch.co.uk/archives/2007/03/24/tweetypy-python-based-cli-client-for-twitter/)"
__URL__="http://snippets.dzone.com/posts/show/4150"

import sys, getopt, getpass, urllib, urllib2

import configreader

STATUS_MODE="STATUS"
VIEW_MODE="VIEW"
COMMAND_MODE="COMMAND"

COMMANDS="""Command\t\tMeaning

d username\tDirect Text
@username\tReply
follow username\tReceive updates via phone or IM
leave username\tStop following username
leave all\tStop following all friends
remove username\tRemove username from friends list
delete username\tDelete username from friends list
get username\tGet the last update from username
get\tGet the most recent updates from all friends
nudge username\tTwitter aks what the person is currently up to
whois username\tGet username's bio
add phonenumber\tSend text invite. If already a member, invite will turn into a friend request.
accept username\tAccept username as a friend
deny username\tDeny username as friend"""

def usage():
	print "Usage: %s [options]" % (sys.argv[0])
	print "\nWithout any options, uses status mode. Leftover args are concatenated to form message."
	print "\n-u|--username <username> specified in tw.conf"
	print "-s|--status mode"
	print "-v|--view status"
	print "-l|--list-commands List Twitter commands"
	print "-c|--config <configfile>"
	print "-h|--help"

	sys.exit()

def set_status(settings, status):
	auth=urllib2.HTTPPasswordMgrWithDefaultRealm()
	auth.add_password(None, settings["rootauthurl"], settings["username"], settings["password"])
	authHandler=urllib2.HTTPBasicAuthHandler(auth)
	opener=urllib2.build_opener(authHandler)

	url="http://twitter.com/statuses/update.xml"
	post=urllib.urlencode({"status":status})

	request=urllib2.Request(url, post)
	request.add_header("User-Agent", settings["useragent"])

	try:
		response=opener.open(request)
	except IOError, e:
		raise "Could not connect."

def view_status(settings):
	url="http://twitter.com/"+settings["username"]
	message=""

	statusdelimeter1=settings["statusdelimeter1"]
	statusdelimeter2=settings["statusdelimeter2"]

	try:
		instream=urllib.urlopen(url)
		for line in instream:
			if statusdelimeter1 in line:
				message=line[
					line.index(statusdelimeter1)+len(statusdelimeter1):line.index(statusdelimeter2)
				]
				break
		instream.close()

		return message
				
	except IOError, e:
		raise "Could not connect."

def main():
	global STATUS_MODE
	global VIEW_MODE
	global COMMAND_MODE
	global COMMANDS

	sysArgs=sys.argv[1:]

	mode=STATUS_MODE

	settings={
		"config":"tw.conf",
		"username":"mcandre",
		"rootauthurl":"http://twitter.com/statuses/",
		"useragent":sys.argv[0]+" "+__version__,
		"statusdelimeter1":"<p class=\"entry-title entry-content\">",
		"statusdelimeter2":"</p>"
	}

	optlist, args=[], []
	try:
		optlist, args=getopt.getopt(sysArgs, "u:svlc:h", ["username=", "status", "view", "list-commands", "config=", "help"])
	except:
		usage()

	for option, value in optlist:
		if option=="-c" or option=="--config":
			settings["config"]=value

	try:
		configreader.load(open(settings["config"], "r"), settings)
	except IOError, e:
		pass

	for option, value in optlist:
		if option=="-h" or option=="--help":
			usage()

		elif option=="-u" or option=="--username":
			settings["username"]=value
		elif option=="-s" or option=="--status":
			mode=STATUS_MODE
		elif option=="-v" or option=="--view":
			mode=VIEW_MODE
		elif option=="-l" or option=="--list=commands":
			mode=COMMAND_MODE

	if mode==STATUS_MODE:
		if len(args)<1:
			usage()

		message=" ".join(args)

		settings["password"]=getpass.getpass()

		set_status(settings, message)
	elif mode==VIEW_MODE:
		print view_status(settings)
	elif mode==COMMAND_MODE:
		print COMMANDS

if __name__=="__main__":
	try:
		main()
	except KeyboardInterrupt, e:
		pass