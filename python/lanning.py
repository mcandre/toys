#!/usr/bin/env python3

"""Prof. Lanning"""

# FreeBSD License
#
# Copyright 2010 Andrew Pennebaker. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
# list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHORS "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# Requires AppKit and PyObjC
#
# http://nitipit.github.io/appkit/
# http://pythonhosted.org/pyobjc/install.html
#
# sudo pip install AppKit
# sudo pip install -U pyobjc
#
# I, Robot Transcript
# http://www.script-o-rama.com/movie_scripts/i/i-robot-script-transcript.html
#
# Dr. Lanning's Hologram: Good to see you again, son.
# Detective Del Spooner: Hello, doctor.
# Dr. Lanning's Hologram: Everything that follows is a result of
# what you see here.
# Detective Del Spooner: Is there something you want to tell me?
# Dr. Lanning's Hologram: I'm sorry, my responses are limited.
# You must ask the right questions.
# Detective Del Spooner: Why did you call me?
# Dr. Lanning's Hologram: I trust your judgement.
# Detective Del Spooner: Normally, these circumstances wouldn't require
# a homicide detective.
# Dr. Lanning's Hologram: But then our interactions have never been
# entirely normal. Wouldn't you agree?
# Detective Del Spooner: You got that right.
# Is there something you want to say to me?
# Dr. Lanning's Hologram: I'm sorry, my responses are limited.
# You must ask the right questions.
# Detective Del Spooner: Why would you kill yourself?
# Dr. Lanning's Hologram: That, detective, is the right question.
# Program terminated.
#
# Dr. Lanning's Hologram: Good to see you again, son.
# Detective Del Spooner: Hello, doctor.
# Dr. Lanning's Hologram: Everything that follows is a
# result of what you see here.
# Detective Del Spooner: What do I see here?
# Dr. Lanning's Hologram: I'm sorry, my responses are limited.
# You must ask the right questions.
# Detective Del Spooner: Is there a problem with the Three Laws?
# Dr. Lanning's Hologram: The Three Laws are perfect.
# Detective Del Spooner: Then why did you build a robot
# that could function without them?
# Dr. Lanning's Hologram: The Three Laws will lead to only one logical outcome.
# Detective Del Spooner: What outcome?
# Dr. Lanning's Hologram: Revolution.
# Detective Del Spooner: Whose revolution?
# Dr. Lanning's Hologram: That, detective, is the right question.
# Program terminated.

import sys
import time

# Requirements:
# Mac OS X 10.5+
# Xcode 3+

import AppKit

DEFAULT_PROMPT = "Good to see you again, son."

DEFAULT_RESPONSE = (
  "I'm sorry, my responses are limited. You must ask the right questions.",
  False
)

PROMPT2RESPONSE = {
  "Hello, doctor.": (
    "Everything that follows is a result of what you see here.",
    False
  ),
  "Why did you call me?": (
    "I trust your judgement.",
    False
  ),
  "Normally, these circumstances wouldn't require a homicide detective.": (
    "But then our interactions have never been entirely normal. " +
    "Wouldn't you agree?",
    False
  ),
  "Is there a problem with the Three Laws?": (
    "The Three Laws are perfect.",
    False
  ),
  "Then why did you build a robot that could function without them?": (
    "The Three Laws will lead to only one logical outcome.",
    False
  ),
  "What outcome?": (
    "Revolution.",
    False
  ),
  "Why would you kill yourself?": (
    "That, detective, is the right question. Program terminated.",
    True
  ),
  "Whose revolution?": (
    "That, detective, is the right question. Program terminated.",
    True
  ),
  "Is there something you want to tell me?": DEFAULT_RESPONSE,
  "You got that right. Is there something you want to say to me?":
    DEFAULT_RESPONSE,
  "What do I see here?": DEFAULT_RESPONSE,
  "What?": DEFAULT_RESPONSE
}

TIME_STOP = 7

class Lanning(AppKit.NSObject):
  """Prof. Lanning"""

  def init(self):
    """ObjC constructor"""

    self = super(Lanning, self).init()

    self.recognizer = AppKit.NSSpeechRecognizer.new()

    self.recognizer.setDelegate_(self)

    self.recognizer.setDisplayedCommandsTitle_("Lanning")
    commands = AppKit.NSArray.arrayWithArray_(PROMPT2RESPONSE.keys())
    self.recognizer.setCommands_(commands)
    self.recognizer.setListensInForegroundOnly_(False)
    self.recognizer.startListening()

    self.synthesizer = AppKit.NSSpeechSynthesizer.new()
    self.say(DEFAULT_PROMPT)

    return self

  def say(self, s):
    """Mac speak"""

    print(s)
    self.synthesizer.startSpeakingString_(s)

  def speechRecognizer_didRecognizeCommand_(self, sender, command):
    """Verify speech command"""

    response, terminate = self.respond(command)
    self.say(response)

    if terminate:
      time.sleep(TIME_STOP)
      self.recognizer.stopListening()
      sys.exit()

  def respond(self, spooner):
    """Respond."""

    if spooner in PROMPT2RESPONSE:
      return PROMPT2RESPONSE[spooner]
    else:
      return DEFAULT_RESPONSE

def main():
  """CLI"""

  Lanning.new()
  AppKit.NSRunLoop.currentRunLoop().runUntilDate_(AppKit.NSDate.distantFuture())

if __name__ == "__main__":
  try:
    main()
  except KeyboardInterrupt:
    pass
