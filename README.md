# Ulysses post to WP
Easily automate posting from Ulysses for Mac to a WordPress blog.

## Usage

Download the [.zip file][1], then unzip it. 

Place the `wp-post.rb` script in a conveient location. If you put it in `~/bin` it will be found by the app. If you put it somewhere else, you’ll have to edit the automator script to point to the new location. Symlinks also work.

In the `wp-post.rb` script, change the placeholder information to what’s needed to log into your blog. Then save your changes.

1. `yourWPblogURL`: the base URL of your WordPress blog.
2. `yourWPusername`: the username you use for logging into your blog.
3. `yourWPpassword`: the password you use for logging into your blog.
4. If you have SSL enabled on your blog (highly recommended) change the `false` to `true`.

From inside Ulysses open the export sheet, and choose HTML snippet, then the app icon -\> other. Navigate to where you saved the Post-to-WordPress app, and select it. 

![Ulysses export sheet.][image-1]

If everything worked, you’ll get a notification showing the post number. Otherwise you’ll see the error message.

## Ulysses formatting

For the original blog post that started this project, see [part one][2] and [part two][3].

Things you need to do in Ulysses:

- The first line needs to be a first level Header (`#`), and it will become the title of the blog post.
- The second line will be a list of tags, the best way to do this is to used the “marked” formatting tag (`::`). This will visually distinguish them.
- The more tag is created by putting `::MORE::` on a line by itself. This is optional, but useful.

Here’s an example:

![Ulysses recommended formatting,][image-2]

The post will be **scheduled for publishing two hours after uploading**, and all other options will be your defaults. The title and tags are the most important, and are easy to configure this way.

## For WordPress.com Users

Blogs hosted on WordPress.com don’t have SSL security for the main blog pages, but the admin interface does. For this use the WordPress.com blog name, instead of the actual URL.

If your blog is located at `myawesomeblog.wordpress.com`, use that for the blog URL in the settings. Even if your blog’s public URL is different, this will still work. Activate SSL, as shown in #4 above, and now your password won’t be sent in plaintext.

## Files

`wp-post.rb`: This is a stand-alone script for use from the command line. It takes standard input and posts to WordPress. If you have HTML on the clipboard, the easiest command is `pbpaste | wp-post.rb`. 

`automator-app.zip`: This is a zip file of the Automator app. It has to be zipped to survive the trip to GitHub and back. Unzipping this will create the `Post-to-WordPress.app`. There will be a security warning the first time the app is run. This is because it wasn’t created on your computer. To open it, right-click and chose open, and then click the open button. Now the app can run normally. Place it in a convenient place on your Mac (`~/Applications` is a good place), and then select it as the app Ulysses will export to. 

## Problems & Bugs

Please [open an issue][4] if you find a problem or bug. If you want to contribute, [pull requests][5] are always welcome.

## Notes

_2015-04-21_

I’ve simplified the app as to not have the posting code inside of it. Having one external script is easier to maintain and update. The Automator apps don’t travel well to GitHub and back. This way I shouldn’t have to update it again as there’s no posting code inside of it. But it now needs both parts, the ruby script and the Automator app to work. It’s a little more work to setup than the old app, but works the same. 

Also, the posting behavior is different. Instead of being sent to the blog as a draft. It is sent as a scheduled post set to be published two hours in the future. This is so I don’t have to interact with WordPress at all. I also won’t forget to publish a draft if I get distracted. I think two hours is enough time to check the preview if there’s any question about formatting.

This app now uses the WordPress native posting API instead of the MetaWeblog API. That’s why posts can now be scheduled.

If there’s interest, I can create and maintain a draft posting branch that has the old behavior.

[1]:	https://github.com/JenniferMack/Ulysses-post-to-WP/archive/master.zip "Direct .zip download."
[2]:	http://jennifermack.net/2015/04/08/post-to-wordpress-from-ulysses/ "Blog link"
[3]:	http://jennifermack.net/2015/04/09/post-to-wordpress-from-ulysses-update-49/ "Blog link."
[4]:	https://github.com/JenniferMack/Ulysses-post-to-WP/issues "Issue tracker."
[5]:	https://github.com/JenniferMack/Ulysses-post-to-WP/pulls "Create a pull request."

[image-1]:	https://jennifermackdotnet.files.wordpress.com/2015/04/20150408-18480200-screenshot-sm.jpg
[image-2]:	https://jennifermackdotnet.files.wordpress.com/2015/04/20150409-15341000-screenshot-sm-4caad16bffa84d168122c7b5efb9429d.jpg