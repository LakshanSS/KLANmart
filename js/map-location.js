function initMap() {
    let place = {lat: 6.917983, lng: 79.860883};
    let map = new google.maps.Map(document.getElementById('map'), {
        zoom: 17,
        center: place
    });
    let marker = new google.maps.Marker({
        position: place,
        map: map
    });
}

/*todo Add more functions in the map*/