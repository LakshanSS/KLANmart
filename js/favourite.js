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
                    //console.log(data.result[i].images);
                    let firstImageURL = JSON.parse(data.result[i].images)[0];
                    console.log('url is'+firstImageURL);
                    var favouriteRow = document.createElement('div');
                    var favouriteItems = document.getElementsByClassName('f-main-content')[0]
                    var favouriteContents = `
                    <div class="post">
                        <img src=${firstImageURL} alt="" srcset="" class="post-image">
                        <div class="post-preview">
                            <h4 class="product-name">${data.result[i].description}</h4>
                            <p class="store-detail"><i class="fas fa-store"></i><strong></strong> Trendy Fashion Store
                            </p>
                            <h4 class="price-tag"><i class="fas fa-tags"></i> LKR ${data.result[i].price}.00</h4>
                            <!-- <i class="fas fa-heart heart-icon"></i> -->
                            <button class="view-more" data-corners="true" data-shadow="false"><p class="view-more-text">view more</p><i class="fas fa-chevron-circle-right"></i></button>
                        </div>
                    </div>`
                    favouriteRow.innerHTML = favouriteContents;
                    favouriteItems.append(favouriteRow);
                }
                sessionStorage.setItem("favourite-count", i);
            });
        });
    } else {
        document.getElementById("if_logged_favourite").style.display = "none";
        document.getElementById("if_not_logged_favourite").style.display = "block";
    }
}

function goToSignUp() {
    document.location.href = "./login.html";
}


function sendEmail() {
    $("#popupLogin").popup("open");

    var countF = sessionStorage.getItem("favourite-count");
    var body = [];
    var toAddress = null;
    toAddress = document.getElementById('txtToEmailId').value;
    var fromAddress = 'kajenchandran@gmail.com';
    var smtpUsername = 'kajenchandran@gmail.com';
    var smtpPassword = 'kaja1114';

    if (toAddress == "") {
        // document.getElementById("sendBtn").disabled = true;faillshare
        setTimeout(function () {
            $("#faillshare").popup("open");
        }, 5);

    } else if (toAddress != "") {

        setTimeout(function () {
            $("#emailSend").popup("open");
        }, 5);
        //generate subject data
        var i;
        for (i = 0; i < countF; i++) {
            var productName = document.getElementsByClassName('product-name')[i].innerText;
            var storeName = document.getElementsByClassName('store-detail')[i].innerText;
            var price = document.getElementsByClassName('price-tag')[i].innerText;
            console.log(productName, storeName, price);
            body[i] = "<br>" + "product name : " + productName + "<br>" + " store name : " + storeName + "<br>" + " price : " + "LKR" + price;
        }
        console.log(body);
        var emailbody = "";
        var x;
        for (x = 0; x < 1; x++) {
            emailbody += body[x] + "<br>";
        }

        console.log(emailbody);


        Email.send({
            Host: "smtp.gmail.com",
            Username: 'kajenchandran@gmail.com',
            Password: "kaja1114",
            To: toAddress,
            From: 'kajenchandran@gmail.com',
            Subject: "KLAN mart",
            Body: "FAVOURITE ITEMS" + "<br>" + emailbody,
            port: 587
        }).then(
            // message => alert("mail sent successfully"),
            // message => 
            // document.location.href = "./favourites.html",


        );

    }



}

function sucesshide() {
    // $('.ui-popup-screen').off();
    $("#emailSend").popup('close');

}

function failedhide() {
    // $('.ui-popup-screen').off();
    $("#faillshare").popup('close');

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