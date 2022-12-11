db.createUser({
  user: '$MONGO_INITDB_ROOT_USERNAME',
  pwd:  '$MONGO_INITDB_ROOT_PASSWORD',
  roles: [{
    role: 'readWrite',
    db: 'online_kart'
  }]
})
db.createCollection("upcoming_shipment")
db.createCollection("upcoming_shipment_logs")
db.createCollection("package_path")
db.createCollection("package_path_logs")
db.createCollection("fc_routes")
db.createCollection("port_routes")