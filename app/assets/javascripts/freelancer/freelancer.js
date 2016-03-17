/*!
 * Start Bootstrap - Freelancer Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('body').on('click', '.page-scroll a', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

// Floating label headings for the contact form
$(function() {
    $("body").on("input propertychange", ".floating-label-form-group", function(e) {
        $(this).toggleClass("floating-label-form-group-with-value", !! $(e.target).val());
    }).on("focus", ".floating-label-form-group", function() {
        $(this).addClass("floating-label-form-group-with-focus");
    }).on("blur", ".floating-label-form-group", function() {
        $(this).removeClass("floating-label-form-group-with-focus");
    });
});

// Highlight the top nav as scrolling occurs
$('body').scrollspy({
    target: '.navbar-fixed-top'
})

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a:not(.dropdown-toggle)').click(function() {
    $('.navbar-toggle:visible').click();
});

$(document).ready(function(){
  updateRangeValue($('input[type=range]'));
  $('input[type=range]').on('input change',function(){
    var input = $(this);
    updateRangeValue(input);
  });    
});
function getRangeGradient(color1,color2,value,maximum,color3){
  var gradient = "linear-gradient(to right, ";
  var breakPoint = (value/maximum)*100;
  var attrValue = gradient + color3 + " 0%, " + color1 + " " + breakPoint + "%, " + color2 + " " + breakPoint + "%, " + color2 + " 100%)";
  return attrValue;
}
function updateRangeValue(input){
  var badColor = "#7D6608"
  var selectedColor = "#F5B041";
  var nonSelectedColor = "#ddd";
  var value = input.val();
  var maximum = input.attr('max'); 
  var inputWidth = input.width();
  var background = getRangeGradient(selectedColor, nonSelectedColor, value, maximum, badColor);
  var offLeft = Math.floor((value / maximum) * inputWidth - (((value / maximum) * inputWidth - inputWidth/2) / 100) * 24);    
  var offLeftAbs = value == maximum ? input.offset().left - 15 + offLeft : input.offset().left - 10 + offLeft;
  input.next('.text').css({'left': offLeftAbs +'px'});
  input.next('.text').html(value);
  input.css('background', background); 
}

