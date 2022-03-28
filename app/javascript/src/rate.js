$(document).ready(function(){
  console.log(2222222)
  $('.average-review-rating').empty();
  // debugger
  $('.average-review-rating').raty({
      size: 20,
      readOnly: true,
      starOn: "../images/star-on.png",
      starOff: "../images/star-off.png",
      starHalf: "../images/star-half.png",
      score: function() {
        return $(this).attr('data-score')
    }
  });
});

//jQuery.fn.init(3) [div.average-review-rating.mt-1, div.average-review-rating.mt-1, div.average-review-rating.mt-1, prevObject: jQuery.fn.init(1)]
//jQuery.fn.init(3) [div.average-review-rating.mt-1, div.average-review-rating.mt-1, div.average-review-rating.mt-1, prevObject: ./node_modules/jquery/src/core/init.js.jQuery.fn.init(1)]