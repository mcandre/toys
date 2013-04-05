#!/usr/bin/env ruby

# Sends email message via Google Mail

require "rubygems"
require "net/smtp"
require "smtp_tls"
require "highline/import"

def mail(to_address, subject, message, username, password)
  from_address="#{username}@gmail.com"
  email="From: #{from_address}\nTo: #{to_address}\nSubject: #{subject}\n\n#{message}"

  Net::SMTP.start("smtp.gmail.com", 587, "localhost.localdomain", username, password, :plain) do |smtp|
    smtp.send_message(email, from_address, to_address)
  end
end

def main
  print "To: "; to=gets.chomp
  print "Subject: "; subject=gets.chomp
  print "Message: "; message=gets.chomp
  print "Username: "; username=gets.chomp
  password=ask("Password: ") { |q| q.echo=false }.chomp

  puts "Sending..."

  mail(to, subject, message, username, password)

  puts "Done"
end

if __FILE__ == $0
  begin
    main
  rescue Interrupt => e
    nil
  end
end
