window.onload = function(){

};

$(document).on('ready page:load', function(){

    $('#check-in-datepicker').datepicker({
      changeMonth: true,
      changeYear: true,
      numberOfMonths: 2,
      dateFormat: "dd-mm-yy",
      minDate: 0,
      beforeShowDay: function(date){
        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
        return [ ($('#booking_blocked_dates').val().split(" ")).indexOf(string) == -1 ];
      },
      onSelect: function( selectedDate ) {
        var check_in_date = $('#check-in-datepicker').datepicker("getDate");
        var check_out_min = new Date(check_in_date.getFullYear(), check_in_date.getMonth(),check_in_date.getDate() + 1);
        $( "#check-out-datepicker" ).datepicker( "option", "minDate", check_out_min );
        setTimeout(function(){
          $( "#check-out-datepicker" ).datepicker('show');
        }, 16);
      }
    });

    $('#check-out-datepicker').datepicker({
      dateFormat: "dd-mm-yy",
      changeMonth: true,
      changeYear: true,
      numberOfMonths: 2,
      minDate: 0,
      beforeShowDay: function(date){
        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
        return [ ($('#booking_blocked_dates').val().split(" ")).indexOf(string) == -1 ];
      }
    });

});
