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
// Ex: curl -v -X POST -d '{ "User": { "email": "jackie@gmail.com", "password": "123123", "join_date": "2019-03-10", "gender": "M", "address": "12, Green Lane, Colombo-04", "f_name": "Jackie", "l_name": "Chan", "mobile_no": "+94744584753" }}' "http://localhost:9002/KLANmart/user" -H "Content-Type:application/json"
// Ex: curl -v -X POST -d '{ "User": { "email": "jackie@gmail.com", "password": "123123"}}' "http://localhost:9002/KLANmart/login" -H "Content-Type:application/json"


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
        var ret = testDB->select("select * from KLANmart.order where user_id = ?", (), userId);

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
        var ret = testDB->select("select product_id from favourites where user_id = ?", (), userId);

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
                                  "INSERT INTO user(email, password, join_date, gender, address, f_name, l_name, mobile_no) values (?, ?, ?, ?, ?, ?, ?, ?)"
                                  , email, password, join_date, gender, address, f_name, l_name,
                                  mobile_no);

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

            var ret = testDB->select("select * from user where email = ?", (), email);

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
}
