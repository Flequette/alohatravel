$(document).ready(function() {
  var address = $('#address').get(0);

  if (address) {
    var autocomplete = new google.maps.places.Autocomplete(address, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(address, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});

function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);

  $('#address').trigger('blur').val(components.address);
  $('#zip_code').val(components.zip_code);
  $('#city').val(components.city);
  if (components.country_code) {
    $('#country').val(components.country);
  }
}

function getAddressComponents(place) {
  var street_number = null;
  var route = null;
  var zip_code = null;
  var city = null;
  var country = null;

  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type == 'street_number') {
        street_number = component.long_name;
      } else if (type == 'route') {
        route = component.long_name;
      } else if (type == 'postal_code') {
        zip_code = component.long_name;
      } else if (type == 'locality') {
        city = component.long_name;
      } else if (type == 'country') {
        country = component.long_name;
      }
    }
  }

  var address = null;
  if (street_number == null && route == null && country == null && city == null) {

  } else if (street_number == null && route == null && city == null){
    address = country
  } else if (street_number == null && route == null && country == null){
    address = city
  } else if (street_number == null && route == null){
    address = city + ', ' + country
  } else if (street_number == null){
    address = route + ', ' + city + ', ' + country
  } else {
    address =  street_number + ' ' + route + ', ' + city + ', ' + country
  }

  return {
    address: address,
    zip_code: zip_code,
    city: city,
    country: country
  };
}
