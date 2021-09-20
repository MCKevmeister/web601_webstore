const express = require ( "express" );
const bodyParser = require ( "body-parser" );
const cors = require ( "cors" );
const app = express ();
const db = require ( "./app/models" );

//register view engine
app.set ( 'view engine', 'ejs' );
app.set ( 'views', path.join ( __dirname, 'views' ) )

const corsOptions = {
    origin: "http://localhost:8081"
};

app.use ( cors ( corsOptions ) );

// parse requests of content-type - application/json
app.use ( bodyParser.json () );

// parse requests of content-type - application/x-www-form-urlencoded
app.use ( bodyParser.urlencoded ( {extended: true} ) );

// sync sequelize models with database
db.sequelize.sync ().then ( () => {
    console.log ( "Sync with DB" )
} )

app.get ( '/', (req, res) => {
    res.render ( 'layout', {template: 'index'} );
} )

// Route handlers
require ( "./app/routes/product.routes" ) ( app );
require ( "./app/routes/category.routes" ) ( app );
require ( "./app/routes/user.routes" ) ( app );
require ( "./app/routes/order.routes" ) ( app );

// set port, listen for requests
const PORT = process.env.PORT || 8080;
app.listen ( PORT, () => {
    console.log ( `Server is running on port ${PORT}.` );
} );
