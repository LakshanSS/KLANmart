import ballerina/log;
import ballerina/mysql;
import ballerina/http;

//Port 9002
listener http:Listener httpListener = new(9002);

//Create mysql client
mysql:Client testDB = new({
    host: "localhost",
    port: 3306,
    name : "KLANmart",
    username: "root",
    password: "rootroot"
});

//Create a record which matches the selected data
type Store record {
    int id;
    string name;
    string reg_date;
    string address;
    string lat;
    string lng;
};

@http:ServiceConfig {basePath: "/KLANmart"}
service orderMgt on httpListener {

    @http:ResourceConfig {
            methods: ["GET"],
            path: "/store/{storeId}"
        }
        resource function findOrder(http:Caller caller, http:Request req, int storeId) {
            var ret = testDB->select("select store_id, store_name, reg_date, address, lat, lng from store where store_id = ?", Store, storeId);
                var storeName = "-";
                var reg_date = "-";
                var address = "-";
                var lat = "-";
                var lng = "-";

                var status = "Success";
                if (ret is table<Store>) {
                    //Iterate each row of the selected data
                    foreach var row in ret {
                        storeName = row.name;
                        reg_date = row.reg_date;
                        address = row.address;
                        lat = row.lat;
                        lng = row.lng;
                    }
                    log:printInfo("Store details: " + storeName + " " + reg_date + " " + address + " " + lat + " " + lng);

                } else if (ret is error) {
                    status = "Error";
                    log:printInfo(<string>ret.detail().message);
                }
                //Stop the mysql client
                //testDB.stop();

            http:Response response = new;
            json payload = { status: status, storeId: storeId, storeName: storeName, reg_date: reg_date,
             address: address, lat: lat, lng: lng};
            // Set the JSON payload in the outgoing response message.
            response.setJsonPayload(untaint payload);

            // Send response to the client.
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", err = result);
            }
        }
}
