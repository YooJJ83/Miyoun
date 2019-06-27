module.exports = function(app){

  const controller = require('./auth.controller.js');

  app.use('/index', controller.index);
  app.use('/show', controller.show);
  app.use('/destroy', controller.destroy);
  app.use('/create', controller.create);

  return app;
}
