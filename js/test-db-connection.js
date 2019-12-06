$(document).ready(function() {
    $.ajax({
        url: "http://localhost:9002/KLANmart/store/1"
    }).then(function(data) {
        /*$('.greeting-id').append(data.id);
        $('.greeting-content').append(data.content);*/
        console.log(data);
    });
});