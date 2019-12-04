import ballerina/http;
import ballerina/io;

#port - 9090
service hello on new http:Listener(9090) {

    # A resource respresenting an invokable API method
    # accessible at `/hello/sayHello`.
    #
    # + caller - the client invoking this resource
    # + request - the inbound request
    resource function sayHello(http:Caller caller, http:Request request) {

        // Sends a response back to the caller.
        error? result = caller->respond("Hello from Ballerina!");
        if (result is error) {
            io:println("Error in responding: ", result);
        }
    }
}