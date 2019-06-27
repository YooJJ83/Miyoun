'use strict';

const fs = require('fs');
const path = require('path');
const Sequelize = require('sequelize');
const basename = path.basename(__filename);
const env = process.env.NODE_ENV || 'development';
const config = require(__dirname + '/../config/config.json')[env];
const db = {};

let sequelize;
if (config.use_env_variable) {
  sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
  sequelize = new Sequelize(config.database, config.username, config.password, config);
}

fs
  .readdirSync(__dirname)
  .filter(file => {
    return (file.indexOf('.') !== 0) && (file !== basename) && (file.slice(-3) === '.js');
  })
  .forEach(file => {
    const model = sequelize['import'](path.join(__dirname, file));
    db[model.name] = model;
  });

Object.keys(db).forEach(modelName => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

db.sequelize = sequelize;
db.Sequelize = Sequelize;

db.tb_acrs_report = require('./tb_acrs_report')(sequelize,Sequelize);
db.tb_acti_pldc = require('./tb_acti_pldc')(sequelize,Sequelize);
db.tb_bsps = require('./tb_bsps')(sequelize,Sequelize);
db.tb_bz_auth = require('./tb_bz_auth')(sequelize,Sequelize);
db.tb_bz_te = require('./tb_bz_te')(sequelize,Sequelize);
db.tb_evid_dcm = require('./tb_evid_dcm')(sequelize,Sequelize);
db.tb_ppay_excl_pn = require('./tb_ppay_excl_pn')(sequelize,Sequelize);
db.tb_rlpy = require('./tb_rlpy')(sequelize,Sequelize);
db.tb_stud_gdc_pldc_tgt_pn = require('./tb_stud_gdc_pldc_tgt_pn')(sequelize,Sequelize);
db.tb_stud_gdc_pldc_tgt_pn_aprv = require('./tb_stud_gdc_pldc_tgt_pn_aprv')(sequelize,Sequelize);
//사용자 번호 외래키 지정

// db.tb_stud_gdc_pldc_tgt_pn.hasMany(db.tb_acti_pldc,{ foreignKey : 'SKLSTF_NO', sourceKey : 'SKLSTF_NO'});
// db.tb_acti_pldc.belongsTo(db.tb_stud_gdc_pldc_tgt_pn,{ foreignKey : 'SKLSTF_NO', targetKey : 'SKLSTF_NO'});
// db.tb_stud_gdc_pldc_tgt_pn.hasMany(db.tb_stud_gdc_pldc_tgt_pn_aprv,{ foreignKey : 'SKLSTF_NO', sourceKey : 'SKLSTF_NO'});
// db.tb_stud_gdc_pldc_tgt_pn_aprv.belongsTo(db.tb_stud_gdc_pldc_tgt_pn,{ foreignKey : 'SKLSTF_NO', targetKey : 'SKLSTF_NO'});
// db.tb_stud_gdc_pldc_tgt_pn.hasMany(db.tb_rlpy,{ foreignKey : 'SKLSTF_NO', sourceKey : 'SKLSTF_NO'});
// db.tb_rlpy.belongsTo(db.tb_stud_gdc_pldc_tgt_pn,{ foreignKey : 'SKLSTF_NO', targetKey : 'SKLSTF_NO'});
// db.tb_stud_gdc_pldc_tgt_pn.hasMany(db.tb_ppay_excl_pn,{ foreignKey : 'SKLSTF_NO', sourceKey : 'SKLSTF_NO'});
// db.tb_ppay_excl_pn.belongsTo(db.tb_stud_gdc_pldc_tgt_pn,{ foreignKey : 'SKLSTF_NO', targetKey : 'SKLSTF_NO'});
// db.tb_stud_gdc_pldc_tgt_pn.hasMany(db.tb_evid_dcm,{ foreignKey : 'SKLSTF_NO', sourceKey : 'SKLSTF_NO'});
// db.tb_evid_dcm.belongsTo(db.tb_stud_gdc_pldc_tgt_pn,{ foreignKey : 'SKLSTF_NO', targetKey : 'SKLSTF_NO'});
// db.tb_stud_gdc_pldc_tgt_pn.hasMany(db.tb_bz_te,{ foreignKey : 'SKLSTF_NO', sourceKey : 'SKLSTF_NO'});
// db.tb_bz_te.belongsTo(db.tb_stud_gdc_pldc_tgt_pn,{ foreignKey : 'SKLSTF_NO', targetKey : 'SKLSTF_NO'});
 db.tb_stud_gdc_pldc_tgt_pn.hasMany(db.tb_bz_auth,{ foreignKey : 'SKLSTF_NO', sourceKey : 'SKLSTF_NO'});
 db.tb_bz_auth.belongsTo(db.tb_stud_gdc_pldc_tgt_pn,{ foreignKey : 'SKLSTF_NO', targetKey : 'SKLSTF_NO'});
// db.tb_stud_gdc_pldc_tgt_pn.hasMany(db.tb_bsps,{ foreignKey : 'SKLSTF_NO', sourceKey : 'SKLSTF_NO'});
// db.tb_bsps.belongsTo(db.tb_stud_gdc_pldc_tgt_pn,{ foreignKey : 'SKLSTF_NO', targetKey : 'SKLSTF_NO'});
// db.tb_stud_gdc_pldc_tgt_pn.hasMany(db.tb_acti_pldc,{ foreignKey : 'SKLSTF_NO', sourceKey : 'SKLSTF_NO'});
// db.tb_acti_pldc.belongsTo(db.tb_stud_gdc_pldc_tgt_pn,{ foreignKey : 'SKLSTF_NO', targetKey : 'SKLSTF_NO'});
// db.tb_stud_gdc_pldc_tgt_pn.hasMany(db.tb_acrs_report,{ foreignKey : 'SKLSTF_NO', sourceKey : 'SKLSTF_NO'});
// db.tb_acrs_report.belongsTo(db.tb_stud_gdc_pldc_tgt_pn,{ foreignKey : 'SKLSTF_NO', targetKey : 'SKLSTF_NO'});
//영역코드 외래키 지정

module.exports = db;
