import ballerina/log;
import ballerina/mysql;
import ballerina/http;
import ballerina/io;

// http://localhost:9002/product/{productId}
// http://localhost:9002/user/{userId}
// http://localhost:9002/store/{storeId}
// http://localhost:9002/order/{orderId}
// http://localhost:9002/orders/{userId}
// http://localhost:9002/products/{storeId}
// http://localhost:9002/favourites/{userId}

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
}
