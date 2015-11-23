$(document).on('ready page:load', function(){

  $
  $('#nav-bar-search-check-in-datepicker').datepicker({
    changeMonth: true,
    changeYear: true,
    numberOfMonths: 2,
    dateFormat: "dd-mm-yy",
    minDate: 0,
    onSelect: function( selectedDate ) {
      var check_in_date = $('#nav-bar-search-check-in-datepicker').datepicker("getDate");
      var check_out_min = new Date(check_in_date.getFullYear(), check_in_date.getMonth(),check_in_date.getDate() + 1);
      $( "#nav-bar-search-check-out-datepicker" ).datepicker( "option", "minDate", check_out_min );
      setTimeout(function(){
        $( "#nav-bar-search-check-out-datepicker" ).datepicker('show');
      }, 16);
    }
  });

  $('#nav-bar-search-check-out-datepicker').datepicker({
    dateFormat: "dd-mm-yy",
    changeMonth: true,
    changeYear: true,
    numberOfMonths: 2,
    minDate: 0
  });

  $('#nav-bar-clear-dates').click(function(){
    $('#nav-bar-search-check-out-datepicker').val('');
    $('#nav-bar-search-check-in-datepicker').val('');
  });

});
