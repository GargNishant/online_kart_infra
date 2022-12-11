# Online Kart Infra

### Introduction
This repository contains the Infra Structure details of the Online Kart complete Application. The Infrastructure includes the CI/CD, Tables, AWS Resources, user-data used during bootstrap. This includes Infra for following applications:
1. Easy Fulfillment
2. Seller Application
3. Customer App

___
### Databases
_There will be 2 Separate Database Servers completely. 1st Database Handling the inventory side of things. 2nd Database handles the Customer Side of things._

_Some way to store Routes which is similar to Route Table. This should consider that air travel might be faster than land travel and a global maximum hops.
The max hops will force the algorithm to find the shortest path with the least number of stops. The Hop Counter is reset when
Airport/Ship Port is included. This allows 2 remote locations to be connected to each other_

It is also possible to delete/add an Airport/FC. This will trigger the script to update the Routes

**Inventory Database:**
1. Table of all registered Airports/Shipping Ports
2. Table of all FulFillment Centers
3. Table of PinCodes service by a FC
4. Table of Current Inventory in each FC
5. Some Way to store Batch of Items moving from one FC to another FC and process them later. Something like a Temporary Table.
   This should also store the time at which we can process the batch
6. Table of current Orders out for Delivery from selected FC
7. Table of Item Category like Mobile, Toy, Mens Shoes, etc.
8. Table of Items Registered in Online Kart.  Has relation with Items Category Table
9. Table of Sellers
10. Table of Sellers with their Items with stock in each FC
11. A simple Table which aggregates the Total Amount/Quantity Sold for each Item Category. Can be done using triggers
12. A simple Table which aggregates the Total Amount/Quantity Sold in each month. Can be done using Triggers or something
13. Table for Items with Quantity (Eventual Consistency with Inventory Db, aggregated over all FC). This will be useful
    for showing only upto 30 left in stock

**Customer Database:**
1. Table of customer
2. Table for Session supporting multi session -- NOT NOW
3. Table for Storing multiple Address for single customer
4. Table of Orders
5. Table of Packages. An Order can have multiple packages all coming from different FC
6. Table for Item Categories (Eventual Consistency with Inventory Db)

**NoSQL DB:**
1. Collection containing Upcoming Shipments for each FCs with Seller Info.
2. A log collection for Upcoming Shipments
3. Collection of current package paths and the path it is supposed to take and current timings
4. Collection containing log of Orders and the Path it is supposed to take and current timings
5. A collection which stores Routes for each FC. Something like a Route Table. Each FC can only store the Routes for FC which
   can be reached from that FC in Global Max Hop Limit. It will also contain Route to the nearest Airport or Ship Port
   Single Route will contain _**"Range of PinCode(Sync with SQL), FC ID, Next Hop"**_ as Entry. Making connecting Path Possible
6. A collection which stores Routes for each Airport/Ship Port. Each Airport will have Routes for all FC which are nearest to it.
   An FC is always assigned to Airport it is nearest to it. A single Route will contain 
   _**"Range of Pincode(Sync with SQL), AirportID, Next Hop"**_ as entry. This makes a future possibility of Connecting Flights.
7. Log of price changes for each item with timestamps
8. Collection of Sellers with Item Sold history. This will contain fc_id, count, etc
___
### Easy FulFillment
1. PostgreSQL Database for Inventory Database
2. MongoDB for NoSQL needs
3. Compute Service to run Scripts which can regularly create/update the Routes or on api call
4. Compute Service for RestAPI on FC front
5. Method/Scrypt for Eventual/Sync Consistency and Sync between Inventory, Customer DB, and NoSQL. Can be done by REST API itself
___
### Seller Application
1. Compute Service for REST API in Seller Application
2. Connection to SQL and NoSQL DB.
___
### Customer Application
1. PostgreSQL Database for Customer Database
2. Compute Service for Rest API
3. Connection with NoSQL and Customer DB


