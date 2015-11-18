$(document).on('page:load', function(){
  // $('#new_booking .input-daterange').click(function(){ alert($(this).html)});
    $('#new_booking .input-daterange').datepicker({
      format: "yyyy/mm/dd",
      todayBtn: "linked",
      todayHighlight: true,
      datesDisabled: ['11/06/2015', '11/21/2015']
    });
  }
);
