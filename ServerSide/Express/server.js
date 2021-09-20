const express = require ( "express" );
const bodyParser = require ( "body-parser" );
const cors = require ( "cors" );
const path = require ( 'path' );

const db = require ( "./app/models" );
const app = express ();
const corsOptions = {
    origin: "http://localhost:8081"
};

app.use ( cors ( corsOptions ) );

// parse requests of content-type - application/json
app.use ( bodyParser.json () );

// parse requests of content-type - application/x-www-form-urlencoded
app.use ( bodyParser.urlencoded ( {extended: true} ) );

// register view engine
app.set ( 'view engine', 'ejs' );
app.set ( 'views', path.join ( __dirname, 'views' ) )

// sync sequelize models with database
db.sequelize.sync ().then ( () => {
    console.log ( "Sync with DB" )
} )

app.get ( '/', (req, res) => {
    res.render ( 'layout', {template: 'index'} );
} )

// Route handlers
app.use ( require ( "./app/routes/product.routes" ) );
app.use ( require ( "./app/routes/category.routes" ) );
app.use ( require ( "./app/routes/user.routes" ) );
app.use ( require ( "./app/routes/order.routes" ) );

// set port, listen for requests
const PORT = process.env.PORT || 8080;
app.listen ( PORT, () => {
    console.log ( `Server is running on port ${PORT}.` );
} );
