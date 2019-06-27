module.exports = function(sequelize, DataTypes) {
  var tb_stud_gdc_pldc_tgt_pn_aprv = sequelize.define('tb_stud_gdc_pldc_tgt_pn_aprv', {
	  YOSA : { type : DataTypes.STRING(4), primaryKey: true}
    , SKLSTF_NO : { type : DataTypes.STRING(15), primaryKey: true}
	  , ARE_CD : { type : DataTypes.STRING(1), primaryKey: true}
	  , APRV_YN : { type : DataTypes.STRING(1)}
    , REG_DTTM : { type : DataTypes.DATE}
	  , RUID : { type : DataTypes.STRING(15)}
	  , UPDT_DTTM : { type : DataTypes.DATE}
	  , UUID : { type : DataTypes.STRING(15)}
  }, {
	  timestamps: false,
	  tableName: 'tb_stud_gdc_pldc_tgt_pn_aprv'
  });
  return tb_stud_gdc_pldc_tgt_pn_aprv;
};
