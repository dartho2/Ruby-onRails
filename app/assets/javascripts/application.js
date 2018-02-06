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
//= require jquery2
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap
//= require autosize
//= require select2
//= require_tree .
//= require cocoon
//



// function update_subtotal() {
//     var subtotal = 0;
//     $('.price').each(function(i){
//         var price = $(this).html();
//         if (!isNaN(price)) subtotal += Number(price);
//     });
//
//     subtotal = subtotal.toFixed(2);
//     $('.subtotal').html(subtotal);
//
//     update_balance();
// }
// function update_balance() {
//     var total = Number($('#subtotal').html()) + Number($('#9').val());
//     total = total.toFixed(2);
//
//     $('.due').html(total);
// }
$(document).on('click', '#js-item-product .remove_fields', function(){
    console.log('delete')
    $(this).parents('#js-item-product').remove();
    // update_subtotal();
    // if ($('.delete').length < 2) $('.delete').hide();
});
