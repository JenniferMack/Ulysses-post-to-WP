#! /usr/bin/env ruby

require 'xmlrpc/client'
require 'json'

begin
    pwfile = File.expand_path("~/.ulysses-wp-password.json")
    pwinfo = JSON.parse(File.open(pwfile).read)
rescue => err
    puts "Password error: #{err}"
    exit
end

begin
    wordpress = XMLRPC::Client.new_from_hash(
        { "host"     => pwinfo["host"],
         "user"     => pwinfo["user"],
         "password" => pwinfo["password"],
         "use_ssl"  => pwinfo["use_ssl"],
         "path"     => "/xmlrpc.php"
        })
rescue => err
    puts "Build XMLRPC error: #{err}"
    exit
end

begin
    post = []
    content = {}

    ARGF.set_encoding('utf-8').each_line do |line|
        next if "\n" == line
        post << line.chomp.gsub(/(a\s+)(href="[^#])/, '\1target="_blank" \2')
    end

    title = post.shift.gsub(/<\/*h1>/, '')
    tags  = post.shift.gsub(/<\/*p>/, '').split(/,\s*/)

    content["post_title"]   = title

    # Comment this line to use categories instead of tags
    content["terms_names"]  = {"post_tag" => tags}
    #
    # Comment this line to use tags instead of categories
    #content["terms_names"]  = {"category" => tags}

    content["post_content"] = post.join("\n\n").sub(/<p>MORE<\/p>/, '<!--more-->')
    content["comment_status"] = "open"

    # Set draft post status
    content["post_status"]  = "draft"
rescue => err
    puts "Build post error: #{err}"
    exit
end

begin
    postnum = wordpress.call(
        'wp.newPost',
        0,
        wordpress.user,
        wordpress.password,
        content,
        )

    puts "Posting Success! (##{postnum})"
rescue => err
    puts "Posting error: #{err}"
end
