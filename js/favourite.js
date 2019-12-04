if (document.readyState == 'loading') {
            document.addEventListener('DOMContentLoaded', ready)
        } else {
            ready();

        }

        function ready() {

            var title = sessionStorage.getItem("title");
            var price = localStorage.getItem("price");
            var image = localStorage.getItem("image");

            addToObject(title, price, image);

            function addToObject(title, price, image) {
                var product = {
                    title: title,
                    price: price,
                    image: image
                }

                const favouriteList = [];
                favouriteList.push(product);

                console.log(product);
                console.log(favouriteList);

                // localStorage.removeItem("title");
                // localStorage.removeItem("price");
                // localStorage.removeItem("image");
            }
            // if (title != null) {

            //     viewCart(title, price, image);

            //     function viewCart(title, price, image) {
            //         console.log(title, price, image)
            //         var cartRow = document.createElement('div')
            //         var cartItems = document.getElementsByClassName('f-main-contend')[0]
            //         var cartRowContents = `
            //     <div class="post">
            //         <img src="${image}" 
            //             class="post-image">
            //         <div class="post-preview">
            //             <h4>${title}</h4>
            //             <p class="store-detail"><strong>Store</strong> Trendy Fashion Store</p>
            //             <h2 class="price-tag">${price}</h2>
            //         </div>
            //     </div>`

            //         cartRow.innerHTML = cartRowContents
            //         console.log(cartRow)
            //         cartItems.append(cartRow)

            //         localStorage.removeItem("title");
            //         localStorage.removeItem("price");
            //         localStorage.removeItem("image");
            //     }
            // }
            function filterItems() {
                var input, filter, div, i, textValue;
                // input = document.getElementsByClassName('f-main-content');
                // filter = in 13b8c18e-85ae-4f1b-88a7-3c9a79fae74c
            }


        }

        function sendEmail() {
            var toAddress = 'chandreswaran.2016323@iit.ac.lk';
            var fromAddress = 'kajenchandran@gmail.com';
            var smtpUsername = 'kajenchandran@gmail.com';
            var smtpPassword = '';
            
            Email.send({
                Host: "smtp.gmail.com",
                Username: 'kajenchandran@gmail.com',
                Password: smtpPassword,
                To: 'chandreswaran.2016323@iit.ac.lk',
                From: 'kajenchandran@gmail.com',
                Subject: "KLAN mart",
                Body: "favourite list",
                port: 587
            }).then(
                message => alert("mail sent successfully")
            );
        }