const tb_bsps = require('../../models').tb_bsps;

exports.init = (req, res) => {
  // tb_bsps.findAll().then((result) => {
  //   console.log(result);
  //   res.render('EPOBspsMng',{
  //     data : result,
  //     rows : result.length
  //   });
  // })
  // .catch((err) => {
  //   console.log(err);
  // });
  res.render('EPOBspsMng');
}

exports.index = (req, res) => {
  // 리스트 조회
  console.log("index 들어옴");
  var where = {};
  if(req.query.areCd !=''){
    where['ARE_CD'] = req.query.areCd;
  }
  if(req.query.yosa!=''){
    where['YOSA'] = req.query.yosa;
  }
    
  tb_bsps.findAll({where}).then((result) => {    
    res.send(result);
  }).catch((err) => {
    console.log(err);
  });  
};

exports.destroy = (req, res) => {
  // 삭제
  console.log("destroy : ");  
  
  destroyRows(tb_bsps, JSON.parse(req.query.gridData)).then(()=> {
    var where = {};

    if(req.query.areCd !=''){
      where['ARE_CD'] = req.query.areCd;
    }
    if(req.query.yosa!=''){
      where['YOSA'] = req.query.yosa;
    }

    tb_bsps.findAll({where}).then((result) => {
      res.send(result);
    })    
  }).catch((err) => {
      console.log(err);
  });    
};

exports.create = (req, res) => {
  // 입력, 업데이트
  console.log("create : ");  
  upsertRows(tb_bsps, JSON.parse(req.query.gridData)).then(()=> {
    var where = {};
    if(req.query.areCd !=''){
      where['ARE_CD'] = req.query.areCd;
    } 
    if(req.query.yosa!=''){
      where['YOSA'] = req.query.yosa;
    }

    tb_bsps.findAll({where}).then((result) => {    
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
      // for(var  key in datas[i]){        //where절을 위한 객체 생성
      //   whereObj[key] = datas[i][key];
      // }       
      whereObj["YOSA"] = datas[i]["YOSA"];
      whereObj["ARE_CD"] = datas[i]["ARE_CD"];
      whereObj["BSPS_CD"] = datas[i]["BSPS_CD"];
      whereObj["BSPS_CN"] = datas[i]["BSPS_CN"];
      whereObj["DV_CD"] = datas[i]["DV_CD"];          
      whereObj["ALLT_MN_ACTI"] = datas[i]["ALLT_MN_ACTI"];   
      
      tgtTable.findOne({                //일치하는 데이터가 있는지 확인
        where : {
          YOSA : whereObj["YOSA"] ,
          ARE_CD : whereObj["ARE_CD"],
          BSPS_CD : whereObj["BSPS_CD"]
        }
      }).then((result) =>{               
        if(result == null){      //일치하는 데이터가 없으면 생성
          getMaxVal(tb_bsps, {
            YOSA : whereObj["YOSA"] ,
            ARE_CD : whereObj["ARE_CD"]
          }).then((result)=>{
            whereObj['BSPS_CD'] = Number(result)+1;
            whereObj['RUID'] = 'PW0000008446';
            whereObj['REG_DTTM'] = new Date;
            console.log("whereObj : "+whereObj['BSPS_CD']);
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
          });          
        }else{                  //일치하는 데이터가 있으면 업데이트 
          tgtTable.update({
            UUID : 'PW0000008446',
            UPDT_DTTM : new Date,
            BSPS_CN : whereObj['BSPS_CN'],
            DV_CD : whereObj['DV_CD'],
            ALLT_MN_ACTI : whereObj['ALLT_MN_ACTI']
          },{
            where : {
              YOSA : whereObj['YOSA'],
              ARE_CD : whereObj['ARE_CD'],
              BSPS_CD : whereObj['BSPS_CD']
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

let getMaxVal = (tgtTable, whereObj) =>{
  return new Promise((resolve, reject) =>{
    tgtTable.max('BSPS_CD', {where : whereObj})
    .then((result) => {
      resolve(result);
      console.log("getMaxVal : " + result);    
    }).catch((error) => {
      reject('Internal Server Error');
      console.log(error);
    });
  });
}

