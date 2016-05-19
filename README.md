# Ulysses post to WP
Easily automate posting from Ulysses for Mac to a WordPress blog. 

Even with the newest version of Ulysses (currently in beta as of mid-May 2016) adding a built-in WordPress uploader, there’s a few things it does I don’t like.
- The Ulysses keywords are used as post tags. I use the keywords to organize sheets, and having content-related keywords clutters things up in the sheet column. I’d rather have them in the post body.
- There’s no option to specify links to open in a new window. 
- No built in support for the `MORE` option. Adding html directly is an option, but I’d rather just type `::MORE::`.

## Usage

Download the [.zip file][1], then unzip it. 

There will be two files `Post-to-Wordpress.app` and `ulysses-wp-password.json`. 

Place the `Post-to-Wordpress.app` in a convenient location. The Applications folder in your home folder is a good location. 

In the `ulysses-wp-password.json` file, change the placeholder information to what’s needed to log into your blog. Then save your changes.

1. `yourWPblogURL.com`: the base URL of your WordPress blog.
2. `yourWPusername`: the username you use for logging into your blog.
3. `yourWPpassword`: the password you use for logging into your blog.
4. `use_ssl`: If you _do not have SSL enabled_ on your blog (not recommended) change the `true` to `false`.

Now copy the `ulysses-wp-password.json` file to your home folder **and rename it to** `.ulysses-wp-password.json`. That’s where the app looks for it. If it’s not there, you’ll get an error message. The best way to do this is from the terminal with this command.
`cp ulysses-wp-password.json ~/.ulysses-wp-password.json`

If you’re using the Finder, hold the option key down while dragging to your home folder, then add the leading dot once it’s copied.

## Usage

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

The post will be uploaded as **a draft post**, and all other options will be your defaults. The title and tags are the most important, and are easy to configure this way.

### Using categories instead of tags

Your taxonomies are your business. The default is to use tags. If you want to use categories, then look at lines 31-35. Categories can be activated by uncommenting line 35, and commenting line 32. To revert using tags, do the opposite.

## For WordPress.com Users

Blogs hosted on WordPress.com have been upgraded to use SSL security recently. So the default is now to use SSL.

If your blog has a custom domain name, you still need to use the WordPress.com blog URL (`myawesomeblog.wordpress.com`, for example)  in the `yourWPblogURL` setting. Using the custom domain might work, but the WordPress.com URL always works.

## Files

`wp-post.rb`: This is a stand-alone script for use from the command line. It takes standard input and posts to WordPress. If you have HTML on the clipboard, the easiest command is `pbpaste | wp-post.rb`. It’s the same code that’s contained in the Automator app. So only download this if you care about posting from the command line. It’s not included in the zip file for this reason.

`automator-app.zip`: This is a zip file of the Automator app and the settings file. It has to be zipped to survive the trip to GitHub and back. Unzipping this will create the `Post-to-WordPress.app` and `ulysses-wp-password.json`. 

There will be a security warning the first time the app is run. This is because it wasn’t created on your computer. To open it, right-click and chose open, and then click the open button. Now the app can run normally. Place it in a convenient place on your Mac (`~/Applications` is a good place), and then select it as the app Ulysses will export to. 

## Problems & Bugs

Please [open an issue][4] if you find a problem or bug. If you want to contribute, [pull requests][5] are always welcome.

[1]:	https://github.com/JenniferMack/Ulysses-post-to-WP/archive/master.zip "Direct .zip download."
[2]:	http://jennifermack.net/2015/04/08/post-to-wordpress-from-ulysses/ "Blog link"
[3]:	http://jennifermack.net/2015/04/09/post-to-wordpress-from-ulysses-update-49/ "Blog link."
[4]:	https://github.com/JenniferMack/Ulysses-post-to-WP/issues "Issue tracker."
[5]:	https://github.com/JenniferMack/Ulysses-post-to-WP/pulls "Create a pull request."

[image-1]:	https://jennifermackdotnet.files.wordpress.com/2015/04/20150408-18480200-screenshot-sm.jpg
[image-2]:	https://jennifermackdotnet.files.wordpress.com/2015/04/20150409-15341000-screenshot-sm-4caad16bffa84d168122c7b5efb9429d.jpg