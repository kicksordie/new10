var express = require( "express" ),
  app = express(),
  port = parseInt( process.env.PORT, 10 ) || 4001;

app.configure( function ()
{
//  app.use( express.methodOverride() );
  app.use( express.bodyParser() );
  //  app.use(express.static(__dirname + '/RatePoly/build'));
//  app.use( express.errorHandler(
//  {
//    dumpExceptions: true,
//    showStack: true
//  } ) );
//  app.use( app.router );
} );


app.use( '/src', express.static( __dirname + '/build/src' ) );
app.use( '/vendor', express.static( __dirname + '/build/vendor' ) );
app.use( '/assets', express.static( __dirname + '/build/assets' ) );

app.all( '/*', function ( req, res, next )
{
  // Just send the index.html for other files to support HTML5Mode
  res.sendfile( 'build/index.html',
  {
    root: __dirname
  } );
} );

app.listen( port );
