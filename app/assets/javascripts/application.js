// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .

$(function() {
  var answer_checkbox = $(".answer-checkbox");
  answer_checkbox.click(function() {
    answer_checkbox.prop("checked", false);
    $(this).prop("checked", true);
  });

  if($(".word-answer").length > 0) {
    $(".word-answer").click(function() {
      var current_block = $(this).closest(".word-block");
      var next_block = current_block.next(".word-block");
      if(next_block.length > 0) {
        current_block.hide();
        next_block.show();
      } else {
        $(".lesson-form").submit();
      }
    });
    $("#word-0").show();
  }
})
