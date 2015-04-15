#!/usr/bin/env ruby

require 'xmlrpc/client'

wordpress = XMLRPC::Client.new_from_hash(
  { "host" => "yourblogurl.com",
    "user" => "yourWPusername",
    "password" => "yourWPpassword",
    "use_ssl" => nil,   #change to true if hosted on SSL
#-------------------------------------------------------
    "path" => "/xmlrpc.php"
  })

post = []
content = {}

ARGF.each_line do |line|
  next if "\n" == line
  post << line.chomp.gsub(/(a\W+)(href="[^#])/, '\1target="_blank" \2')
end

content["title"] = post.shift.gsub(/<\/*h1>/, '')
content["mt_keywords"] = post.shift.gsub(/<\/*p>/, '').split(/,\s*/)
content["description"] = post.join("\n\n").sub(/<p>MORE<\/p>/, '<!--more-->')
 
begin
  postnum = wordpress.call(
    'metaWeblog.newPost',
    0,
    wordpress.user,
    wordpress.password,
    content,
    false     # false for draft, true for publish
  )

  puts "Posting Success! (##{postnum})"
rescue => err
  puts "Posting error: #{err}"
end

