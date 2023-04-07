// This script just set some application user's permissions and creates the sample collection in the user's schema
// The application user is 'vshop'

let userName = process.env.MONGO_INITDB_DATABASE;
let password = process.env.MONGO_INITDB_DATABASE;
let database = process.env.MONGO_INITDB_DATABASE;

console.log("Creating users and collections");
db.createUser(
    {
        user: userName,
        pwd: password,
        roles: [
            {
                role: "readWrite",
                db: database
            },
            {
                role: "dbOwner",
                db: database
            }
        ]
    }
);
db.getSiblingDB(database).createCollection("products");
