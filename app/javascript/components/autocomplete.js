function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var dealAddress = document.getElementById('deal_address');

    if (dealAddress) {
      var autocomplete = new google.maps.places.Autocomplete(dealAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(dealAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
