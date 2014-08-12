#!/usr/bin/env ruby

require 'webrick/httpauth'
require 'webrick/httpproxy'

# Generate htdigest.txt:
# htdigest -c <filename> <realm> <username>

def main
  authenticator = WEBrick::HTTPAuth::ProxyDigestAuth.new(
    UserDB: WEBrick::HTTPAuth::Htdigest.new('htdigest.txt'),
    Realm: 'trapdoor'
  )

  server = WEBrick::HTTPProxyServer.new(
    ProxyAuthProc: ->(req, res) { authenticator.authenticate(req, res) },
    MaxClients: 100,
    BindAddress: 'localhost',
    Port: 8080,
    AccessLog: [] # suppress log messages
  )

  trap('INT') { server.shutdown }

  server.start
end

main if $PROGRAM_NAME == __FILE__
