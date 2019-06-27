const tb_bz_auth = require('../../models').tb_bz_auth;
const tb_stud_gdc_pldc_tgt_pn = require('../../models').tb_stud_gdc_pldc_tgt_pn;

exports.init = (req, res) => {
  tb_bz_auth.findAll({
    include : [tb_stud_gdc_pldc_tgt_pn] //join할 테이블
  }).then((result) => {
    console.log(result);
    res.render('EPOAuthMng',{
      data : result,
      rows : result.length
    });
  })
  .catch((err) => {
    console.log(err);
  });
}

exports.index = (req, res) => {
  // 리스트 조회
  console.log("index 들어옴");
  var where = {};

  if(req.query.authCd !=''){
    where['AUTH_CD'] = req.query.authCd;
  }
  if(req.query.sklstfNo!=''){
    where['SKLSTF_NO'] = req.query.sklstfNo;
  }

  tb_bz_auth.findAll({
    where,
    include : [tb_stud_gdc_pldc_tgt_pn]   //join할 테이블})
  }).then((result) => {    
    res.send(result);
  })
  .catch((err) => {
    console.log(err);
  });
};

exports.destroy = (req, res) => {
  // 삭제 
  destroyRows(tb_bz_auth, JSON.parse(req.query.gridData) )
  .then(()=> {
    var where = {};
    if(req.query.authCd !=''){
      where['AUTH_CD'] = req.query.authCd;
    }
    if(req.query.sklstfNo!=''){
      where['SKLSTF_NO'] = req.query.sklstfNo;
    }

    tb_bz_auth.findAll({
      where,
      include : [tb_stud_gdc_pldc_tgt_pn]   //join할 테이블})
    }).then((result) => {    
      res.send(result);
    })    
  }).catch((err) => {
      console.log(err);
  });  
};

exports.create = (req, res) => {
  // 입력, 업데이트       
  upsertRows(tb_bz_auth, JSON.parse(req.query.gridData) )
  .then(()=> {
    var where = {};
    if(req.query.authCd !=''){
      where['AUTH_CD'] = req.query.authCd;
    } 
    if(req.query.sklstfNo!=''){
      where['SKLSTF_NO'] = req.query.sklstfNo;
    }

    tb_bz_auth.findAll({
      where,
      include : [tb_stud_gdc_pldc_tgt_pn]   //join할 테이블})
    }).then((result) => {    
      res.send(result);
    })    
  }).catch((err) => {
      console.log(err);
  });
};

//다중 행 삭제
let destroyRows = (tgtTable, datas) => {
  var whereObj = {}
  return new Promise((resolve, reject) =>{
    for(var i = 0; i < datas.length; i++){
      for(var  key in datas[i]){        
        whereObj[key] = datas[i][key];
      }      
      tgtTable.destroy({
        where : whereObj
      }).then((result, err) => {
        if(err){
          reject('Internal Server Error');
        }else{
          resolve(result);
        } 
      }).catch((err) => {
        console.log(err);
      });
    }  
  })  
}

//값이 있으면 update, 없으면 insert 
let upsertRows = (tgtTable, datas) => {
  
  return new Promise((resolve, reject) =>{
    for(var i = 0; i < datas.length; i++){
      let whereObj = {};
      for(var  key in datas[i]){        //where절을 위한 객체 생성
        whereObj[key] = datas[i][key];
      }       
      tgtTable.findOne({                //일치하는 데이터가 있는지 확인
        where : {
          SKLSTF_NO : whereObj['SKLSTF_NO']
        }
      }).then((result) =>{               
        if(result == null){      //일치하는 데이터가 없으면 생성          
          whereObj['RUID'] = 'PW0000008446';
          whereObj['REG_DTTM'] = new Date;
          tgtTable.create(whereObj).then((result, err) => {
            if(err){
              reject('Internal Server Error');
            } 
            else{
              resolve(result);
            } 
          }).catch((err) => {
            console.log(err);
          });
        }else{                  //일치하는 데이터가 있으면 업데이트          
          whereObj['UUID'] = 'PW0000008446';
          whereObj['UPDT_DTTM'] = new Date;
          tgtTable.update({
            AUTH_CD : whereObj['AUTH_CD'],
            UUID : 'PW0000008446',
            UPDT_DTTM : new Date
          },{
            where : {
              SKLSTF_NO : whereObj['SKLSTF_NO']
            }
          }).then((result, err) => {
            if(err){
              reject('Internal Server Error');
            } 
            else{
              resolve(result);
            } 
          }).catch((err) => {
            console.log(err);
          });
        }
      })
    }  
  })  
}

