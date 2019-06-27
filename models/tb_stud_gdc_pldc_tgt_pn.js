module.exports = function(sequelize, DataTypes) {
  var tb_stud_gdc_pldc_tgt_pn = sequelize.define('tb_stud_gdc_pldc_tgt_pn', {
	  SKLSTF_NO : { type : DataTypes.STRING(15), primaryKey: true}
    , SKLSTF_NM : { type : DataTypes.STRING(15)}
    , DEPT_CODE : { type : DataTypes.STRING(20)}
	  , DEPT_NM : { type : DataTypes.STRING(200)}
    , CLSF_CODE : { type : DataTypes.STRING(14)}
	  , CLSF_NM : { type : DataTypes.STRING(200)}
    , CLSS_CODE : { type : DataTypes.STRING(14)}
	  , CLSS_NM : { type : DataTypes.STRING(200)}
    , TEL : { type : DataTypes.STRING(11)}
	  , MP : { type : DataTypes.STRING(11)}
    , REG_DTTM : { type : DataTypes.DATE}
	  , RUID : { type : DataTypes.STRING(15)}
	  , UPDT_DTTM : { type : DataTypes.DATE}
	  , UUID : { type : DataTypes.STRING(15)}
  }, {
	  timestamps: false,
	  tableName: 'tb_stud_gdc_pldc_tgt_pn'
  });
  return tb_stud_gdc_pldc_tgt_pn;
};
