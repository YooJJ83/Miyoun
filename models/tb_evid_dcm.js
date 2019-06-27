module.exports = function(sequelize, DataTypes) {
  var tb_evid_dcm = sequelize.define('tb_evid_dcm', {
	  YOSA : { type : DataTypes.STRING(4), primaryKey: true}
    , SKLSTF_NO : { type : DataTypes.STRING(15), primaryKey: true}
	  , ARE_CD : { type : DataTypes.STRING(1), primaryKey: true}
	  , BSPS_CD : { type : DataTypes.STRING(2), primaryKey: true}
	  , FILE_ID : { type : DataTypes.STRING(20)}
	  , FILE_KEY : { type : DataTypes.STRING(18)}
    , REG_DTTM : { type : DataTypes.DATE}
	  , RUID : { type : DataTypes.STRING(15)}
	  , UPDT_DTTM : { type : DataTypes.DATE}
	  , UUID : { type : DataTypes.STRING(15)}
  }, {
	  timestamps: false,
	  tableName: 'tb_evid_dcm'
  });
  return tb_evid_dcm;
};
