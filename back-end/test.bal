import ballerina/log;
import ballerina/mysql;
import ballerina/http;
import ballerina/io;

//Get
// http://localhost:9002/product/{productId}
// http://localhost:9002/user/{userId}
// http://localhost:9002/store/{storeId}
// http://localhost:9002/order/{orderId}
// http://localhost:9002/orders/{userId}
// http://localhost:9002/products/{storeId}
// http://localhost:9002/favourites/{userId}
// http://localhost:9002/reviews/{productId}

//Post
// http://localhost:9002/KLANmart/user
// Ex: curl -v -X POST -d '{ "User": { "email": "kk@gmail.com", "password": "123123", "join_date": "2019-03-10", "gender": "M", "address": "12, Green Lane, Colombo-04", "f_name": "Jackie", "l_name": "Chan", "mobile_no": "+94744584753" }}' "http://localhost:9002/KLANmart/user" -H "Content-Type:application/json"

// http://localhost:9002/KLANmart/login
// Ex: curl -v -X POST -d '{ "User": { "email": "jackie@gmail.com", "password": "123123"}}' "http://localhost:9002/KLANmart/login" -H "Content-Type:application/json"

// http://localhost:9002/KLANmart/favourite
// curl -v -X POST -d '{ "Favourite": { "user_id": 2, "product_id": 1}}' "http://localhost:9002/KLANmart/favourite" -H "Content-Type:application/json"
// curl -v -X DELETE -d '{ "Favourite": { "user_id": 2, "product_id": 2}}' "http://localhost:9002/KLANmart/favourite" -H "Content-Type:application/json"

// http://localhost:9002/KLANmart/cart
// curl -v -X POST -d '{ "Item": { "user_id": 2, "product_id": 1, "order_time": "2019-10-11 10:45:14", "order_status": "cart", "quantity": 2, "store_id": 2}}' "http://localhost:9002/KLANmart/cart" -H "Content-Type:application/json"

// http://localhost:9002/KLANmart/buy

//when clicking buy in cart page
//curl -v -X POST -d '{ "Item": { "order_id": 3, "user_id": 2, "product_id": 1, "total_amount": 2199, "order_time": "2019-10-11 10:45:14", "order_status": "paid", "quantity": 2, "store_id": 2}}' "http://localhost:9002/KLANmart/buy" -H "Content-Type:application/json"

//when clicking buy from product page
//curl -v -X POST -d '{ "Item": { "user_id": 2, "product_id": 1, "total_amount": 333, "order_time": "2019-10-11 10:45:14", "order_status": "paid", "quantity": 2, "store_id": 2}}' "http://localhost:9002/KLANmart/buy" -H "Content-Type:application/json"

//Port 9002
listener http:Listener httpListener = new(9002);

//Create mysql client
mysql:Client testDB = new({
        host: "localhost",
        port: 3306,
        name: "KLANmart",
        username: "root",
        password: "rootroot"
    });

@http:ServiceConfig { basePath: "/KLANmart" }
service klanmart_service on httpListener {

    //1. Get product details by giving product_id
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/product/{productId}"
    }
    resource function getProductDetails(http:Caller caller, http:Request req, int productId) {
        //Select query to get product data
        var ret = testDB->select("select * from product where product_id = ?", (), productId);

        //Initialising the payload and response
        json payload = { status: "success" };
        http:Response response = new;

        if (ret is table< record {} >) {
            var jsonConversionRet = json.convert(ret);
            io:println(io:sprintf("%s", jsonConversionRet));

            if (jsonConversionRet is json) {
                payload.result = jsonConversionRet;
            } else {
                payload.status = "failed";
                payload.message = "error in converting result into json";
            }

        } else {
            payload.status = "failed";
            payload.message = "result is not in a table format";
        }

        // Set the JSON payload in the outgoing response message.
        response.setJsonPayload(untaint payload);

        // Send response to the client.
        var result = caller->respond(response);
        if (result is error) {
            log:printError("Error sending response", err = result);
        }
    }

    //2. Get user details by giving user_id
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/user/{userId}"
    }
    resource function getUserDetails(http:Caller caller, http:Request req, int userId) {
        //Select query to get user data
        var ret = testDB->select("select * from user where user_id = ?", (), userId);

        //Initialising the payload and response
        json payload = { status: "success" };
        http:Response response = new;

        if (ret is table< record {} >) {
            var jsonConversionRet = json.convert(ret);
            io:println(io:sprintf("%s", jsonConversionRet));

            if (jsonConversionRet is json) {
                payload.result = jsonConversionRet;
            } else {
                payload.status = "failed";
                payload.message = "error in converting result into json";
            }

        } else {
            payload.status = "failed";
            payload.message = "result is not in a table format";
        }

        // Set the JSON payload in the outgoing response message.
        response.setJsonPayload(untaint payload);

        // Send response to the client.
        var result = caller->respond(response);
        if (result is error) {
            log:printError("Error sending response", err = result);
        }
    }

    //3. Get store details by giving store_id
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/store/{storeId}"
    }
    resource function getStoreDetails(http:Caller caller, http:Request req, int storeId) {
        //Select query to get store data
        var ret = testDB->select("select * from store where store_id = ?", (), storeId);

        //Initialising the payload and response
        json payload = { status: "success" };
        http:Response response = new;

        if (ret is table< record {} >) {
            var jsonConversionRet = json.convert(ret);
            io:println(io:sprintf("%s", jsonConversionRet));

            if (jsonConversionRet is json) {
                payload.result = jsonConversionRet;
            } else {
                payload.status = "failed";
                payload.message = "error in converting result into json";
            }

        } else {
            payload.status = "failed";
            payload.message = "result is not in a table format";
        }

        // Set the JSON payload in the outgoing response message.
        response.setJsonPayload(untaint payload);

        // Send response to the client.
        var result = caller->respond(response);
        if (result is error) {
            log:printError("Error sending response", err = result);
        }
    }

    //4. Get order details by giving order_id
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/order/{orderId}"
    }
    resource function getOrderDetails(http:Caller caller, http:Request req, int orderId) {
        //Select query to get store data
        var ret = testDB->select("select * from KLANmart.order where order_id = ?", (), orderId);

        //Initialising the payload and response
        json payload = { status: "success" };
        http:Response response = new;

        if (ret is table< record {} >) {
            var jsonConversionRet = json.convert(ret);
            io:println(io:sprintf("%s", jsonConversionRet));

            if (jsonConversionRet is json) {
                payload.result = jsonConversionRet;
            } else {
                payload.status = "failed";
                payload.message = "error in converting result into json";
            }

        } else {
            payload.status = "failed";
            payload.message = "result is not in a table format";
        }

        // Set the JSON payload in the outgoing response message.
        response.setJsonPayload(untaint payload);

        // Send response to the client.
        var result = caller->respond(response);
        if (result is error) {
            log:printError("Error sending response", err = result);
        }
    }

    //5. Get orders of a user by giving user_id
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/orders/{userId}"
    }
    resource function getOrdersByUserId(http:Caller caller, http:Request req, int userId) {
        //Select query
        var ret = testDB->select("select * from KLANmart.order inner join product on product.product_id =
         order.product_id inner join store on order.store_id = store.store_id where user_id = ?;", (), userId);

        //Initialising the payload and response
        json payload = { status: "success" };
        http:Response response = new;

        if (ret is table< record {} >) {
            var jsonConversionRet = json.convert(ret);
            io:println(io:sprintf("%s", jsonConversionRet));

            if (jsonConversionRet is json) {
                payload.result = jsonConversionRet;
            } else {
                payload.status = "failed";
                payload.message = "error in converting result into json";
            }

        } else {
            payload.status = "failed";
            payload.message = "result is not in a table format";
        }

        // Set the JSON payload in the outgoing response message.
        response.setJsonPayload(untaint payload);

        // Send response to the client.
        var result = caller->respond(response);
        if (result is error) {
            log:printError("Error sending response", err = result);
        }
    }

    //6. Get products of a store by giving store_id
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/products/{storeId}"
    }
    resource function getProductsOfStore(http:Caller caller, http:Request req, int storeId) {
        //Select query
        var ret = testDB->select("select * from product where store_id = ?", (), storeId);

        //Initialising the payload and response
        json payload = { status: "success" };
        http:Response response = new;

        if (ret is table< record {} >) {
            var jsonConversionRet = json.convert(ret);
            io:println(io:sprintf("%s", jsonConversionRet));

            if (jsonConversionRet is json) {
                payload.result = jsonConversionRet;
            } else {
                payload.status = "failed";
                payload.message = "error in converting result into json";
            }

        } else {
            payload.status = "failed";
            payload.message = "result is not in a table format";
        }

        // Set the JSON payload in the outgoing response message.
        response.setJsonPayload(untaint payload);

        // Send response to the client.
        var result = caller->respond(response);
        if (result is error) {
            log:printError("Error sending response", err = result);
        }
    }

    //7. Get favourite products of a user by giving user_id
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/favourites/{userId}"
    }
    resource function getFavouritesOfUser(http:Caller caller, http:Request req, int userId) {
        //Select query
        var ret = testDB->select("select * from favourites f inner join product p on f.product_id=p.product_id inner
        join store s on s.store_id= p.store_id where user_id =?", (), userId);

        //Initialising the payload and response
        json payload = { status: "success" };
        http:Response response = new;

        if (ret is table< record {} >) {
            var jsonConversionRet = json.convert(ret);
            io:println(io:sprintf("%s", jsonConversionRet));

            if (jsonConversionRet is json) {
                payload.result = jsonConversionRet;
            } else {
                payload.status = "failed";
                payload.message = "error in converting result into json";
            }

        } else {
            payload.status = "failed";
            payload.message = "result is not in a table format";
        }

        // Set the JSON payload in the outgoing response message.
        response.setJsonPayload(untaint payload);

        // Send response to the client.
        var result = caller->respond(response);
        if (result is error) {
            log:printError("Error sending response", err = result);
        }
    }

    //8. Get reviews about a product by giving product_id
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/reviews/{productId}"
    }
    resource function getReviewsOfProduct(http:Caller caller, http:Request req, int productId) {
        //Select query
        var ret = testDB->select("select review.review_id, review.comment, review.desc_rating, review.comm_rating,
         review.delivery_rating, user.f_name, user.l_name from review inner join user on review.user_id=user.user_id
         where product_id = ?", (), productId);

        //Initialising the payload and response
        json payload = { status: "success" };
        http:Response response = new;

        if (ret is table< record {} >) {
            var jsonConversionRet = json.convert(ret);
            io:println(io:sprintf("%s", jsonConversionRet));

            if (jsonConversionRet is json) {
                payload.result = jsonConversionRet;
            } else {
                payload.status = "failed";
                payload.message = "error in converting result into json";
            }

        } else {
            payload.status = "failed";
            payload.message = "result is not in a table format";
        }

        // Set the JSON payload in the outgoing response message.
        response.setJsonPayload(untaint payload);

        // Send response to the client.
        var result = caller->respond(response);
        if (result is error) {
            log:printError("Error sending response", err = result);
        }
    }

    //Post methods

    //1. Add a user
    @http:ResourceConfig {
        methods: ["POST"],
        path: "/user"
    }
    resource function addUser(http:Caller caller, http:Request req) {
        http:Response response = new;
        var userData = req.getJsonPayload();
        io:println(userData);
        if (userData is json) {
            string email = userData.User.email.toString();
            string password = userData.User.password.toString();
            string join_date = userData.User.join_date.toString();
            string gender = userData.User.gender.toString();
            string address = userData.User.address.toString();
            string f_name = userData.User.f_name.toString();
            string l_name = userData.User.l_name.toString();
            string mobile_no = userData.User.mobile_no.toString();

            json payload = { status: "success", message: "user added" };

            var ret = testDB->update(
                                  "INSERT INTO user(email, password, join_date, gender, address, f_name, l_name,
                                  mobile_no) values (?, ?, ?, ?, ?, ?, ?, ?)", email, password, join_date, gender,
                                  address, f_name, l_name, mobile_no);

            if (ret is error) {
                io:println(" Failed: " + <string>ret.detail().message);
                payload.status = "failed";
                payload.message = "error";
            } else {
                io:println("Success: added user to the KLANmart DB");
            }

            // Create response message.
            response.setJsonPayload(untaint payload);

            // Send response to the client.
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        } else {
            response.statusCode = 400;
            response.setPayload("Invalid payload received");
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        }
    }

    //2. Login
    @http:ResourceConfig {
        methods: ["POST"],
        path: "/login"
    }
    resource function login(http:Caller caller, http:Request req) {
        http:Response response = new;
        var userData = req.getJsonPayload();
        io:println("Login: Input credintials are");
        io:println(userData);
        if (userData is json) {
            string email = userData.User.email.toString();
            string password = userData.User.password.toString();

            json payload = { status: "success", message: "login success" };

            var ret = testDB->select("select * from user where email = ? limit 1", (), email);

            if (ret is table< record {} >) {
                var jsonConversionRet = json.convert(ret);
                if (jsonConversionRet is json) {
                    if (jsonConversionRet.length() == 0) {
                        payload.status = "failed";
                        payload.message = "invalid email";
                    } else if (jsonConversionRet[0].password === password) {
                        payload.status = "success";
                        payload.message = "valid";
                        payload.data = jsonConversionRet[0];
                    } else {
                        payload.status = "failed";
                        payload.message = "invalid password";
                    }
                } else {
                    payload.status = "failed";
                    payload.message = "error in converting result into json";
                }
            } else {
                payload.status = "failed";
                payload.message = "result is not in a table format";
            }

            // Create response message.
            response.setJsonPayload(untaint payload);
            // Send response to the client.
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        } else {
            response.statusCode = 400;
            response.setPayload("Invalid payload received");
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        }
    }

    //3. Add favourite by giving user_id and product_id
    @http:ResourceConfig {
        methods: ["POST"],
        path: "/favourite"
    }
    resource function addFavourite(http:Caller caller, http:Request req) {
        http:Response response = new;
        var favData = req.getJsonPayload();
        io:println(favData);
        if (favData is json) {
            string user_id = favData.Favourite.user_id.toString();
            string product_id = favData.Favourite.product_id.toString();

            json payload = { status: "success", message: "favourite added" };

            var ret = testDB->update("INSERT INTO favourites(user_id, product_id) values (?, ?)", user_id, product_id);

            if (ret is error) {
                io:println(" Failed: " + <string>ret.detail().message);
                payload.status = "failed";
                payload.message = "error";
            } else {
                io:println("Success: added favourite to the KLANmart DB");
            }

            // Create response message.
            response.setJsonPayload(untaint payload);

            // Send response to the client.
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        } else {
            response.statusCode = 400;
            response.setPayload("Invalid payload received");
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        }
    }

    //4. Add a product to cart
    @http:ResourceConfig {
        methods: ["POST"],
        path: "/cart"
    }
    resource function addToCart(http:Caller caller, http:Request req) {
        http:Response response = new;
        var cartData = req.getJsonPayload();
        io:println(cartData);
        if (cartData is json) {
            string user_id = cartData.Item.user_id.toString();
            string product_id = cartData.Item.product_id.toString();
            string order_time = cartData.Item.order_time.toString();
            string order_status = cartData.Item.order_status.toString();
            string quantity = cartData.Item.quantity.toString();
            string store_id = cartData.Item.store_id.toString();

            json payload = { status: "success", message: "product added to cart" };

            var ret = testDB->update("INSERT INTO KLANmart.order(user_id, product_id, order_time, order_status, quantity,
            store_id) values (?, ?, ?, ?, ?, ?)", user_id, product_id, order_time, order_status, quantity, store_id);

            if (ret is error) {
                io:println(" Failed: " + <string>ret.detail().message);
                payload.status = "failed";
                payload.message = "error";
            } else {
                io:println("Success: added product to the cart");
            }

            // Create response message.
            response.setJsonPayload(untaint payload);

            // Send response to the client.
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        } else {
            response.statusCode = 400;
            response.setPayload("Invalid payload received");
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        }
    }

    //5. Buy a product
    @http:ResourceConfig {
        methods: ["POST"],
        path: "/buy"
    }
    resource function buyProduct(http:Caller caller, http:Request req) {
        http:Response response = new;
        var buyData = req.getJsonPayload();
        io:println(buyData);
        if (buyData is json) {
            string user_id = buyData.Item.user_id.toString();
            string product_id = buyData.Item.product_id.toString();
            string order_time = buyData.Item.order_time.toString();
            string order_status = buyData.Item.order_status.toString();
            string quantity = buyData.Item.quantity.toString();
            string store_id = buyData.Item.store_id.toString();
            string total_amount = buyData.Item.total_amount.toString();
            string order_id = buyData.Item.order_id.toString();

            json payload = { status: "success", message: "order added" };
            if (order_id == "null") {
                //curl -v -X POST -d '{ "Item": { "user_id": 2, "product_id": 1, "total_amount": 333, "order_time": "2019-10-11 10:45:14", "order_status": "paid", "quantity": 2, "store_id": 2}}' "http://localhost:9002/KLANmart/buy" -H "Content-Type:application/json"
                var ret = testDB->update("INSERT INTO KLANmart.order(user_id, product_id, order_time, order_status,
                 quantity, store_id, total_amount) values (?, ?, ?, ?, ?, ?, ?)", user_id, product_id, order_time,
                    order_status, quantity, store_id, total_amount);
                if (ret is error) {
                    io:println(" Failed: " + <string>ret.detail().message);
                    payload.status = "failed";
                    payload.message = "error";
                } else {
                    io:println("Added new order");
                }
            } else {
                //curl -v -X POST -d '{ "Item": { "order_id": 3, "user_id": 2, "product_id": 1, "total_amount": 2199, "order_time": "2019-10-11 10:45:14", "order_status": "paid", "quantity": 2, "store_id": 2}}' "http://localhost:9002/KLANmart/buy" -H "Content-Type:application/json"
                var ret = testDB->update("UPDATE KLANmart.order SET order_status = (?) WHERE order_id = (?)",
                    order_status, order_id);
                if (ret is error) {
                    io:println(" Failed: " + <string>ret.detail().message);
                    payload.status = "failed";
                    payload.message = "error";
                } else {
                    io:println("Set order status of order id " + order_id + " to " + order_status);
                }
            }

            // Create response message.
            response.setJsonPayload(untaint payload);

            // Send response to the client.
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        } else {
            response.statusCode = 400;
            response.setPayload("Invalid payload received");
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        }
    }

    //6. Add Feedback
    @http:ResourceConfig {
        methods: ["POST"],
        path: "/feedback"
    }
    resource function addFeedback(http:Caller caller, http:Request req) {
        http:Response response = new;
        var feedbackData = req.getJsonPayload();
        io:println(feedbackData);
        if (feedbackData is json) {
            string user_id = feedbackData.userId.toString();
            string product_id = feedbackData.productId.toString();
            string comment = feedbackData.comment.toString();
            string desc_rating = feedbackData.desc_rating.toString();
            string comm_rating = feedbackData.comm_rating.toString();
            string delivery_rating = feedbackData.delivery_rating.toString();
            string store_id = feedbackData.storeId.toString();

            json payload = { status: "success", message: "order added" };

            //curl -v -X POST -d '{ "Item": { "user_id": 2, "product_id": 1, "total_amount": 333, "order_time": "2019-10-11 10:45:14", "order_status": "paid", "quantity": 2, "store_id": 2}}' "http://localhost:9002/KLANmart/buy" -H "Content-Type:application/json"
            var ret = testDB->update("INSERT INTO KLANmart.review(user_id, product_id, comment, desc_rating,
                 comm_rating, delivery_rating, store_id) values (?, ?, ?, ?, ?, ?, ?)", user_id, product_id, comment,
                desc_rating, comm_rating, delivery_rating, store_id);
            if (ret is error) {
                io:println(" Failed: " + <string>ret.detail().message);
                payload.status = "failed";
                payload.message = "error";
            } else {
                io:println("Added new order");
            }

            // Create response message.
            response.setJsonPayload(untaint payload);

            // Send response to the client.
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        } else {
            response.statusCode = 400;
            response.setPayload("Invalid payload received");
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        }
    }

    //7. Delete favourite by giving user_id and product_id
    @http:ResourceConfig {
        methods: ["DELETE"],
        path: "/favourite"
    }
    resource function deleteFavourite(http:Caller caller, http:Request req) {
        http:Response response = new;
        var favData = req.getJsonPayload();
        io:println(favData);
        if (favData is json) {
            string user_id = favData.Favourite.user_id.toString();
            string product_id = favData.Favourite.product_id.toString();

            json payload = { status: "success", message: "favourite deleted" };

            var ret = testDB->update("DELETE FROM favourites WHERE user_id=(?) and product_id=(?)", user_id, product_id);
            // curl -v -X DELETE -d '{ "Favourite": { "user_id": 2, "product_id": 2}}' "http://localhost:9002/KLANmart/favourite" -H "Content-Type:application/json"

            if (ret is error) {
                io:println(" Failed: " + <string>ret.detail().message);
                payload.status = "failed";
                payload.message = "error";
            } else {
                io:println("Success: deleted favourite from KLANmart DB");
            }

            // Create response message.
            response.setJsonPayload(untaint payload);

            // Send response to the client.
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        } else {
            response.statusCode = 400;
            response.setPayload("Invalid payload received");
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        }
    }
}
