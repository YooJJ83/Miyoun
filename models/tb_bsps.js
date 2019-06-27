module.exports = function(sequelize, DataTypes) {
  var tb_bsps = sequelize.define('tb_bsps', {
	  YOSA : { type : DataTypes.STRING(4), primaryKey: true}
	  , ARE_CD : { type : DataTypes.STRING(1), primaryKey: true}
	  , BSPS_CD : { type : DataTypes.STRING(2), primaryKey: true}
	  , BSPS_CN : { type : DataTypes.STRING(200)}
	  , DV_CD : { type : DataTypes.STRING(2)}
	  , ALLT_MN_ACTI : { type : DataTypes.STRING(200)}
    , REG_DTTM : { type : DataTypes.DATE}
	  , RUID : { type : DataTypes.STRING(15)}
	  , UPDT_DTTM : { type : DataTypes.DATE}
	  , UUID : { type : DataTypes.STRING(15)}
  }, {
	  timestamps: false,
	  tableName: 'tb_bsps'
  });
  return tb_bsps;
};
