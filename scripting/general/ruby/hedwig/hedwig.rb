#!/usr/bin/env ruby

# Sends email message via Google Mail

require 'rubygems'
require 'net/smtp'
require 'highline/import'
require 'contracts'
include Contracts

require './smtp_tls'

Contract String, String, String, String, String => String
def self.mail(to_address, subject, message, username, password)
    from_address = "#{username}@gmail.com"
    email = "From: #{from_address}\nTo: #{to_address}\nSubject: #{subject}\n\n#{message}"

    Net::SMTP.start('smtp.gmail.com', 587, 'localhost.localdomain', username, password, :plain) do |smtp|
        smtp.send_message(email, from_address, to_address)
    end
end

def main
    print 'To: '
    to = gets.chomp

    print 'Subject: '
    subject = gets.chomp

    print 'Message: '
    message = gets.chomp

    print 'Username: '
    username = gets.chomp

    password = ask('Password: ') { |q| q.echo = false }.chomp

    puts 'Sending...'

    mail(to, subject, message, username, password)

    puts 'Done'
end

if $PROGRAM_NAME == __FILE__
    begin
        main
    rescue Interrupt
        nil
    end
end
