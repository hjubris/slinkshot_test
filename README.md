# slinkshot_test

A test app recreating the home page and profile page on Slinkshot

The home page works as intended. It's comprised of a row of buttons that filter categories on top, a switch between clips and lives (not implemented) and a PageView with a placeholder (here a static color) and info about the user and the video.

The profile page is almost perfect. The profile picture is in a Hero widget, and below it there are info, a follow button, a tip and a chat button, and a grid/list switch, to change how the clips are shown. The gridView works as intended, whereas I had some problems implementing a PageView in a SliverList, so it doesn't snap as intended.
