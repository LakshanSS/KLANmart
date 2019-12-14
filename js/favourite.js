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
                    favouriteItems.append(favouriteRow);
                }
            });
        });
    } else {
        document.getElementById("if_logged_favourite").style.display = "none";
        document.getElementById("if_not_logged_favourite").style.display = "block";
    }
}


function sendEmail() {
    var body = null;
    var toAddress = null;
    toAddress = document.getElementById('txtToEmailId').value;
    var fromAddress = 'kajenchandran@gmail.com';
    var smtpUsername = 'kajenchandran@gmail.com';
    var smtpPassword = '';
    if (toAddress == "") {

    } else if (toAddress != "") {
        Email.send({
            Host: "smtp.gmail.com",
            Username: 'kajenchandran@gmail.com',
            Password: smtpPassword,
            To: toAddress,
            From: 'kajenchandran@gmail.com',
            Subject: "KLAN mart",
            Body: "favourite list",
            port: 587
        }).then(
            message => alert("mail sent successfully")
        );
    }

}


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



                //     <div class="cart">
                //     <input type="checkbox" name="checkbox-1a" id="checkbox-1a" checked="" class="selector"
                //         data-shadow="false" data-cacheval="true"
                //         style="cursor: pointer; margin-top: 66px; margin-left: -4px; background-color: black !important;">
                //     <img src="../assets/images/favourite/image1.jpeg" alt="" srcset="" class="cart-image">
                //     <div class="cart-detail">
                //         <p class="cart-category"><b>Sweater</b></p>
                //         <i class="fa fa-close close-icon"></i>
                //         <h4 class="cart-name">Hooded Sweater</h4>
                //         <p class="cart-color">Grey</p>
                //         <p class="cart-delivery">Non-Returnable</p>
                //         <button class="ui-btn ui-btn-inline buy-btn" onclick="addToCartClicked(event)">
                //             <p style="margin-top: -14px;">Buy</p>
                //         </button>
                //         <h5 class="cart-price"><i class="fas fa-tags"
                //                 style="font-size: 11px; margin-right: 3px; margin-top: -6px; color: rgb(141, 141, 141);"></i>LKR
                //             2598.00</h5>
                //         <div class="qty-container">
                //             <i class="fas fa-minus-circle"></i>
                //             <input type="number" data-corners="false" data-wrapper-class="qty-space">
                //             <i class="fas fa-plus-circle"></i>
                //         </div>
                //     </div>
                //     <p class="shipping-detail">Free Shipping</p>
                // </div> 