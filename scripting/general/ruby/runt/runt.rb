#!/usr/bin/env ruby

require 'webrick'

def main
    server = WEBrick::HTTPServer.new(
        MaxClients: 100,
        MimeTypes: WEBrick::HTTPUtils::DefaultMimeTypes,
        DirectoryIndex: ['index.html', 'index.htm', 'index.cgi', 'index.rhtml'],
        BindAddress: 'localhost',
        Port: 8080,
        DocumentRoot: File.dirname($PROGRAM_NAME) + '/' + 'www/',
        AccessLog: [] # suppress log messages
    )

    trap('INT') { server.shutdown }

    server.start
end

main if $PROGRAM_NAME == __FILE__
