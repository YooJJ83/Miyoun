module.exports =function(app){
  
  const auth = require('./auth/auth.js')(app);
  app.use('/auth', auth);
  return app;
};
