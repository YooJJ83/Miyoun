module.exports = function(sequelize, DataTypes) {
  var tb_bz_te = sequelize.define('tb_bz_te', {
    PC_DV : { type : DataTypes.STRING(1), primaryKey: true}
	  , YOSA : { type : DataTypes.STRING(4), primaryKey: true}
    , BZ_DV_CD : { type : DataTypes.STRING(1), primaryKey: true}
	  , SRT_DTTM : { type : DataTypes.STRING(14)}
	  , END_DTTM : { type : DataTypes.STRING(14)}	  
    , REG_DTTM : { type : DataTypes.DATE}
	  , RUID : { type : DataTypes.STRING(15)}
	  , UPDT_DTTM : { type : DataTypes.DATE}
	  , UUID : { type : DataTypes.STRING(15)}
  }, {
	  timestamps: false,
	  tableName: 'tb_bz_te'
  });
  return tb_bz_te;
};
