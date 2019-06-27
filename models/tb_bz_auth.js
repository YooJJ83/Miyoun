module.exports = function(sequelize, DataTypes) {
  var tb_bz_auth = sequelize.define('tb_bz_auth', {
	  SKLSTF_NO : { type : DataTypes.STRING(15), primaryKey: true}
	  , AUTH_CD : { type : DataTypes.STRING(15), primaryKey: true}
	  , REG_DTTM : { type : DataTypes.DATE}
	  , RUID : { type : DataTypes.STRING(15)}
	  , UPDT_DTTM : { type : DataTypes.DATE}
	  , UUID : { type : DataTypes.STRING(15)}
  }, {
	  timestamps: false,
	  tableName: 'tb_bz_auth'
  });
  return tb_bz_auth;
};
