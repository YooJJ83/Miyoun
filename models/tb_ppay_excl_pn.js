module.exports = function(sequelize, DataTypes) {
  var tb_ppay_excl_pn = sequelize.define('tb_ppay_excl_pn', {
	  YOSA : { type : DataTypes.STRING(4), primaryKey: true}
    , SKLSTF_NO : { type : DataTypes.STRING(15), primaryKey: true}	  
    , REG_DTTM : { type : DataTypes.DATE}
	  , RUID : { type : DataTypes.STRING(15)}
	  , UPDT_DTTM : { type : DataTypes.DATE}
	  , UUID : { type : DataTypes.STRING(15)}
  }, {
	  timestamps: false,
	  tableName: 'tb_ppay_excl_pn'
  });
  return tb_ppay_excl_pn;
};
