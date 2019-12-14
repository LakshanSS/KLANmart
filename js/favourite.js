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
                    // ${data.result[i].images}
                    var favouriteContents = `
                    <div class="post">
                        <img src=${data.result[i].images} alt="" srcset="" class="post-image">
                        <div class="post-preview">
                            <h4>${data.result[i].description}</h4>
                            <p class="store-detail"><i class="fas fa-store"></i><strong></strong> Trendy Fashion Store
                            </p>
                            <h4 class="price-tag"><i class="fas fa-tags"></i> ${data.result[i].price}.00</h4>
                            <!-- <i class="fas fa-heart heart-icon"></i> -->
                            <button class="view-more" data-corners="true" data-shadow="false"><p class="view-more-text">view more</p><i class="fas fa-chevron-circle-right"></i></button>
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


{/* <div class="post">
                        <img src="../assets/images/favourite/tshirt1-blue.png" alt="" srcset="" class="post-image">
                        <div class="post-preview">
                            <h4>2019 Spring Brand Clothing Men's Long Sleeve Round Neck T-Shirt</h4>
                            <p class="store-detail"><i class="fas fa-store"></i><strong></strong> Trendy Fashion Store
                            </p>
                            <h4 class="price-tag"><i class="fas fa-tags"></i> LKR 2199.00</h4>
                            <!-- <i class="fas fa-heart heart-icon"></i> -->
                            <button class="view-more" data-corners="true" data-shadow="false"><p class="view-more-text">view more</p><i class="fas fa-chevron-circle-right"></i></button>
                        </div>
                    </div>
                    <div class="post">
                        <img src="../assets/images/favourite/image2.jpeg" alt="" srcset="" class="post-image">
                        <div class="post-preview">
                            <h4>Hayiou gt1 tws water proof Finger print Touch Blutooth Earphones</h4>
                            <p class="store-detail"><strong>Store</strong> 3C Global Tradings</p>
                            <h3 class="price-tag"> LKR 1500.00</h3>
                        </div>
                    </div> */}
