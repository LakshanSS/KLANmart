function initMap() {
    //Give lat and lang of the location
    let place = {lat: 6.917983, lng: 79.860883};

    let map = new google.maps.Map(document.getElementById('map'), {
        zoom: 17,
        center: place,
        streetViewControl: true,
        panControl: true,
        zoomControl: true,
        mapTypeControl: true,
        /*mapTypeControlOptions: {
            style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
        },*/
        scaleControl: true,
        overviewMapControl: true,
        rotateControl: true,
        draggable: false //to avoid user getting lost in the map
    });

    //Code for the marker
    let marker = new google.maps.Marker({
        position: place,
        icon:'../assets/images/StoreMap/marker-klanmart.png',
        animation: google.maps.Animation.BOUNCE,
        map: map
    });

    var infowindow = new google.maps.InfoWindow({
        content: "This is the location of Trendy Fashion Store!"
    });

    google.maps.event.addListener(marker, 'click', function () {
        infowindow.open(map, marker);
    });
}

function goToProduct() {
    document.location.href = "./product.html";
}