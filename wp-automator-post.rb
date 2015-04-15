require 'xmlrpc/client'

wordpress = XMLRPC::Client.new_from_hash(
  { "host" => "yourWPblogURL",
    "user" => "yourWPusername",
    "password" => "yourWPpassword",
    "use_ssl" => false,   #change to true if hosted on SSL
#-------------------------------------------------------
    "path" => "/xmlrpc.php"
  })

post = []
content = {}

ARGV.each do |f|
  File.open(f, :encoding => "UTF-8") do |file|
    file.each_line do |line|
      next if "\n" == line
      post << line.chomp.gsub(/(a\W+)(href="[^#])/, '\1target="_blank" \2')
    end
  end
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

  puts "Posting Success! (#{postnum})"
rescue => err
  puts "Posting error: #{err}"
end
