window.onload = function () {
    var loggedUser = sessionStorage.getItem("logged_user");

    if (loggedUser != null) {
        document.getElementById("if_not_logged_favourite").style.display = "none";
        document.getElementById("if_logged_favourite").style.display = "block";

        var myJson = JSON.parse(loggedUser);
        console.log(myJson.user_id);

        $(document).ready(function () {
            $.ajax({
                url: "http://localhost:9002/KLANmart/favourites/" + myJson.user_id
            }).then(function (data) {
                console.log(data.result);

                var i;
                for (i = 0; i < data.result.length; i++) {
                    console.log(data.result[i].images);
                    var favouriteRow = document.createElement('div');
                    var favouriteItems = document.getElementsByClassName('f-main-content')[0]
                    console.log(favouriteItems);

                    var favouriteContents = `
                    <div class="post">
                    <img src=${data.result[i].images} alt="" srcset="" class="post-image">
                        <div class="post-preview">
                            <h4>${data.result[i].description}</h4>
                            <p class="store-detail"><strong>Store</strong> Trendy Fashion Store</p>
                            <h3 class="price-tag">LKR ${data.result[i].price}.00</h3>
                            <!-- <i class="fas fa-heart heart-icon"></i> -->
                                        </div>
                                    </div>`
                    favouriteRow.innerHTML = favouriteContents;
                    console.log(favouriteRow);
                    favouriteItems.append(favouriteRow);
                }
            });
        });
    } else {
        document.getElementById("if_logged_favourite").style.display = "none";
        document.getElementById("if_not_logged_favourite").style.display = "block";
    }
}




// function sendEmail() {
//     var toAddress = 'chandreswaran.2016323@iit.ac.lk';
//     var fromAddress = 'kajenchandran@gmail.com';
//     var smtpUsername = 'kajenchandran@gmail.com';
//     var smtpPassword = '';

//     Email.send({
//         Host: "smtp.gmail.com",
//         Username: 'kajenchandran@gmail.com',
//         Password: smtpPassword,
//         To: 'chandreswaran.2016323@iit.ac.lk',
//         From: 'kajenchandran@gmail.com',
//         Subject: "KLAN mart",
//         Body: "favourite list",
//         port: 587
//     }).then(
//         message => alert("mail sent successfully")
//     );
// }


