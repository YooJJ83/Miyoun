module.exports = function(sequelize, DataTypes) {
  var tb_rlpy = sequelize.define('tb_rlpy', {
	  YOSA : { type : DataTypes.STRING(4), primaryKey: true}
    , SKLSTF_NO : { type : DataTypes.STRING(15), primaryKey: true}
    , RLPY : { type : DataTypes.INTEGER}
    , REG_DTTM : { type : DataTypes.DATE}
	  , RUID : { type : DataTypes.STRING(15)}
	  , UPDT_DTTM : { type : DataTypes.DATE}
	  , UUID : { type : DataTypes.STRING(15)}
  }, {
	  timestamps: false,
	  tableName: 'tb_rlpy'
  });
  return tb_rlpy;
};
