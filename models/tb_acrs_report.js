module.exports = function(sequelize, DataTypes) {
  var tb_acrs_report = sequelize.define('tb_acrs_report', {
	  YOSA : { type : DataTypes.STRING(4), primaryKey: true}
    , SKLSTF_NO : { type : DataTypes.STRING(15), primaryKey: true}
	  , ARE_CD : { type : DataTypes.STRING(1), primaryKey: true}
	  , BSPS_CD : { type : DataTypes.STRING(2), primaryKey: true}
	  , CT : { type : DataTypes.INTEGER}
	  , SC : { type : DataTypes.INTEGER}
    , REG_DTTM : { type : DataTypes.DATE}
	  , RUID : { type : DataTypes.STRING(15)}
	  , UPDT_DTTM : { type : DataTypes.DATE}
	  , UUID : { type : DataTypes.STRING(15)}
  }, {
	  timestamps: false,
	  tableName: 'tb_acrs_report'
  });
  return tb_acrs_report;
};
