$(document).ready ->
  $("#change").click ->
    currency = $("#currency").val()
    currency_destination = $("#currency_destination").val() 
    
    $("#currency").val(currency_destination)
    $("#currency_destination").val(currency)


  $("#quantity").keyup ->
    do exchange

  exchange = -> 
    $.ajax '/exchange',
        type: 'POST'
        dataType: 'json'
        data: {
                currency: $("#currency").val(),
                currency_destination: $("#currency_destination").val(),
                quantity: $("#quantity").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
      return false;