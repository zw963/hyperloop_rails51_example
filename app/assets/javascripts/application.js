// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

// 这三行, 是 hyperloop 文档中要求加的, 而且必须在 hyperloop-loader 前面.
// 虽然不知道 jquery_ujs 还有什么用.
//= require react_ujs
//= require jquery
//= require jquery_ujs

//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require hyperloop-loader
