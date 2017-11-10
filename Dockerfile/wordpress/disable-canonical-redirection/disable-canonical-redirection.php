<?php
/*
Plugin Name: Disable Canonical URL Autocorrect Guessing
Description: Disables Wordpress' URL autocorrection guessing feature. If you for example enter the URL http://www.myblog.com/proj you won't be redirected to http://www.myblog.com/project-2013 anymore.
Author: Denny Zhang
Version: 0.1
*/
remove_filter('template_redirect', 'redirect_canonical');
