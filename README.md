# Ulysses post to WP
Easily automate posting from Ulysses for Mac to a WordPress blog.

## Usage

Download the [latest release][1] (or just the [app zip file][2]), then unzip the file. Open it using Automator (you have to launch the Automator app first, then open this app). In the `Run Shell Script` box, change the placeholder information to what’s needed to log into your blog. Then save your changes.

1. `yourWPblogURL`: the base URL of your WordPress blog.
2. `yourWPusername`: the username you use for logging into your blog.
3. `yourWPpassword`: the password you use for logging into your blog.
4. If you have SSL enabled on your blog (highly recommended) change the `false` to `true`.

From inside Ulysses open the export sheet, and choose HTML snippet, then the app icon -\> other. Navigate to where you saved the Post-to-WordPress app, and select it. 

![Ulysses export sheet.][image-1]

If everything worked, you’ll get a notification showing the post number. Otherwise you’ll see the error message.

## For WordPress.com Users

Blogs hosted on WordPress.com don’t have SSL security for the main blog pages, but the admin interface does. For this use the WordPress.com blog name, instead of the actual URL.

If your blog is located at `myawesomeblog.wordpress.com`, use that for the blog URL in the settings. Even if your blog’s public URL is different, this will still work. Activate SSL, as shown in #4 above, and now your password won’t be sent in plaintext.

## Files

`wp-post.rb`: This is a stand-alone script for use from the command line. It takes standard input and posts to WordPress. If you have HTML on the clipboard, the easiest command is `pbpaste | wp-post.rb`. 

`wp-automator-post.rb`: This is the guts of the script that powers the Automator app. It’s here as a way to read the code without having to dig into the Automator app. There are a few changes to the main loop to deal with how Ulysses passes a temporary file.

`automator-app.zip`: This is a zip file of the Automator app. It has to be zipped to survive the trip to GitHub and back. Unzipping this will create the `Post-to-WordPress.app`. Edit it with Automator, as described above before running the first time. There will be a security warning because it wasn’t created on your computer. To open it, right-click and chose open, and then click the open button. Now the app can run normally. Place it in a convenient place on your Mac (`~/Applications` is a good place), and then select it as the app Ulysses will export to. 

## Problems & Bugs

Please [open an issue][3] if you find a problem or bug. If you want to contribute, [pull requests][4] are always welcome.

[1]:	https://github.com/JenniferMack/Ulysses-post-to-WP/releases/latest "Link to latest release."
[2]:	https://github.com/JenniferMack/Ulysses-post-to-WP/blob/master/automator-app.zip?raw=true "Direct .zip download."
[3]:	https://github.com/JenniferMack/Ulysses-post-to-WP/issues "Issue tracker."
[4]:	https://github.com/JenniferMack/Ulysses-post-to-WP/pulls "Create a pull request."

[image-1]:	https://jennifermackdotnet.files.wordpress.com/2015/04/20150408-18480200-screenshot-sm.jpg