var descriptionRating = 5;
var communicationRating = 5;
var deliveryRating = 5;


function starClicked(value, ratingItem) {

    switch (value) {
        case 1:
            document.getElementById(ratingItem + 1).style.color = "orange";
            document.getElementById(ratingItem + 2).style.color = "#2a2a2a";
            document.getElementById(ratingItem + 3).style.color = "#2a2a2a";
            document.getElementById(ratingItem + 4).style.color = "#2a2a2a";
            document.getElementById(ratingItem + 5).style.color = "#2a2a2a";
            break;
        case 2:
            document.getElementById(ratingItem + 1).style.color = "orange";
            document.getElementById(ratingItem + 2).style.color = "orange";
            document.getElementById(ratingItem + 3).style.color = "#2a2a2a";
            document.getElementById(ratingItem + 4).style.color = "#2a2a2a";
            document.getElementById(ratingItem + 5).style.color = "#2a2a2a";
            break;
        case 3:
            document.getElementById(ratingItem + 1).style.color = "orange";
            document.getElementById(ratingItem + 2).style.color = "orange";
            document.getElementById(ratingItem + 3).style.color = "orange";
            document.getElementById(ratingItem + 4).style.color = "#2a2a2a";
            document.getElementById(ratingItem + 5).style.color = "#2a2a2a";
            break;
        case 4:
            document.getElementById(ratingItem + 1).style.color = "orange";
            document.getElementById(ratingItem + 2).style.color = "orange";
            document.getElementById(ratingItem + 3).style.color = "orange";
            document.getElementById(ratingItem + 4).style.color = "orange";
            document.getElementById(ratingItem + 5).style.color = "#2a2a2a";
            break;
        case 5:
            document.getElementById(ratingItem + 1).style.color = "orange";
            document.getElementById(ratingItem + 2).style.color = "orange";
            document.getElementById(ratingItem + 3).style.color = "orange";
            document.getElementById(ratingItem + 4).style.color = "orange";
            document.getElementById(ratingItem + 5).style.color = "orange";
            break;
    }

    switch (ratingItem){
        case 'star_desc':
            descriptionRating = value;
            break;
        case 'star_comm':
            communicationRating = value;
            break;
        case 'delivery_comm':
            deliveryRating = value;
            break;
    }

    console.log(ratingItem + " Rating is : " + value);
}