const express = require('express')
const moment = require('moment')
const path = require('path')

const router = express.Router()

const os = require('os');
/**获取ip地址 */
function getIPAdress() {
  var interfaces = os.networkInterfaces();
  for (var devName in interfaces) {
    var iface = interfaces[devName];
    for (var i = 0; i < iface.length; i++) {
      var alias = iface[i];
      if (alias.family === 'IPv4' && alias.address !== '127.0.0.1' && !alias.internal) {
        return alias.address;
      }
    }
  }
}
const baseURL = getIPAdress();

console.log(`http://${baseURL}:5000`)



//创建数据库连接对象
const mysql = require('mysql')
const conn = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'mall'
})




// start product

// 获取所有未删除的产品的列表
router.get('/api/getprodlist', (req, res) => {
  // 定义Sql语句
  const sqlStr = 'select * from product where isdel=0 order by id asc'
  conn.query(sqlStr, (err, results) => {
    console.log(err)
    if (err) return res.json({ status: 1, message: '获取数据失败', affectedRows: 0 })
    res.json({ status: 0, message: results, affectedRows: 0 })
  })
})

// 添加产品
router.post('/api/addproduct', (req, res) => {
  const product = req.body


  console.log(product)
  // 补全英雄的创建时间
  product.ctime = moment().format('YYYY-MM-DD HH:mm:ss')
  product.isdel = 0

  const sqlStr = 'insert into product set ?'
  conn.query(sqlStr, product, (err, results) => {
    if (err) return res.json({ status: 1, message: '添加失败！', affectedRows: 0 })
    if (results.affectedRows !== 1) return res.json({ status: 1, message: '添加失败！', affectedRows: 0 })
    res.json({ status: 0, message: '添加成功', affectedRows: results.affectedRows })
  })
})

router.post('/api/postaxios', (req, res) => {
  let o = req.body
  console.log(o)
  res.json({ status: 0, message: [{ name: 'fly' }] })
})

// 根据ID删除产品
router.get('/api/delproduct/:id', (req, res) => {
  // const id = req.query.id
  const id = req.params.id
  const sqlStr = 'update product set isdel=1 where id=?'
  conn.query(sqlStr, id, (err, results) => {
    if (err) return res.json({ status: 1, message: '删除英雄失败！', affectedRows: 0 })
    if (results.affectedRows !== 1) return res.json({ status: 1, message: '删除英雄失败！', affectedRows: 0 })
    res.json({ status: 0, message: '删除英雄成功！', affectedRows: results.affectedRows })
  })
})

// 绝对删除所有的产品
router.get('/api/delall', (req, res) => {
  const sqlStr = 'truncate table product'
  conn.query(sqlStr, (err, results) => {
    if (err) return res.json({ status: 1, message: '清空失败', affectedRows: 0 })
    res.json({ status: 0, message: '清空成功！', affectedRows: 0 })
  })
})

// end product


// start home

// 获取轮播图片地址
router.get('/api/getlunbo', function (req, res, next) {

  // 定义Sql语句
  const sqlStr = 'select * from lunbo where isdel=0 order by id asc'
  conn.query(sqlStr, (err, results) => {
    results.forEach(item => {
      if (item.img.length > 0) {
        item.img = 'http://' + baseURL + ':5000' + item.img
      }
    })
    if (err) return res.json({ status: 1, message: '获取轮播失败', affectedRows: 0 })
    res.json({ status: 0, message: results, affectedRows: 0 })
  })
});

// end home

// start gird 

// 获取轮播图片地址
router.get('/api/girds', function (req, res, next) {

  // 定义Sql语句
  const sqlStr = 'select * from gird where isdel=0'
  conn.query(sqlStr, (err, results) => {
    results.forEach(item => {
      if (item.src.length > 0) {
        item.src = 'http://' + baseURL + ':5000' + item.src
      }
    })
    if (err) return res.json({ status: 1, message: '获取轮播失败', affectedRows: 0 })
    res.json({ status: 0, message: results, affectedRows: 0 })
  })
});

// end gird 


// start news

// 获取所有未删除的新闻的列表
router.get('/api/getnewslist', (req, res) => {
  // 定义Sql语句
  const sqlStr = 'select * from news where isdel=0 order by id asc'
  conn.query(sqlStr, (err, results) => {
    results.forEach(item => {
      if (item.img_url.length > 0) {
        item.img_url = 'http://' + baseURL + ':5000' + item.img_url
      }
    })
    console.log(err)
    if (err) return res.json({ status: 1, message: '获取数据失败', affectedRows: 0 })
    res.json({ status: 0, message: results, affectedRows: 0 })
  })
})


// 根据ID获取新闻
router.get('/api/getnew/:id', (req, res) => {
  const id = req.params.id
  const sqlStr = 'select * from news where id=?'
  conn.query(sqlStr, id, (err, results) => {
    // 执行Sql语句失败
    if (err) return res.json({ status: 1, message: '获取新闻失败', affectedRows: 0 })
    if (results.length !== 1) return res.json({ status: 1, message: '新闻不存在！', affectedRows: 0 })
    res.json({
      status: 0,
      message: results[0],
      affectedRows: 0
    })
  })
})


// 添加新闻
router.post('/api/addnew', (req, res) => {
  const news = req.body
  // 补全英雄的创建时间
  news.add_time = moment().format('YYYY-MM-DD HH:mm:ss')
  news.isdel = 0
  // console.log(news)
  const sqlStr = 'insert into news set ?'
  conn.query(sqlStr, news, (err, results) => {
    if (err) return res.json({ status: 1, message: '添加失败！', affectedRows: 0 })
    if (results.affectedRows !== 1) return res.json({ status: 1, message: '添加失败！', affectedRows: 0 })
    res.json({ status: 0, message: '添加成功', affectedRows: results.affectedRows })
  })
})

// 绝对删除所有新闻
router.get('/api/delnews', (req, res) => {
  const sqlStr = 'truncate table news'
  conn.query(sqlStr, (err, results) => {
    if (err) return res.json({ status: 1, message: '清空失败', affectedRows: 0 })
    res.json({ status: 0, message: '清空成功！', affectedRows: 0 })
  })
})

// end news


//  start comments 

// 分页查询语句
router.get('/api/getcomments/:artid', (req, res) => {
  // 定义Sql语句
  let start = ((req.query.pageindex || 1) - 1) * 2;

  const id = req.params.artid

  const limit = req.query.limit || 2

  const sqlStr = 'SELECT * FROM comments where artid = ? limit ' + start + ',' + limit + ' '
  const sqlStr2 = 'SELECT count(*) FROM comments where artid = ?'



  conn.query(sqlStr, id, (err1, results1) => {
    conn.query(sqlStr2, id, (err2, results2) => {
      if (err2) return res.json({ status: 1, message: '获取数据失败', affectedRows: 0 })
      res.json({ status: 0, count: results2[0]['count(*)'], message: results1, affectedRows: 0 })
    })
  })
})

// 添加评论
router.post('/api/postcomment/:artid', (req, res) => {
  const comment = req.body
  // 补全英雄的创建时间
  comment.user_name = '匿名用户'
  comment.add_time = moment().format('YYYY-MM-DD HH:mm:ss')
  comment.isdel = 0
  comment.artid = req.params.artid


  // console.log(req.body.artid)
  console.log(comment)
  const sqlStr = 'insert into comments set ?'
  conn.query(sqlStr, comment, (err, results) => {
    if (err) return res.json({ status: 1, message: '添加失败！', affectedRows: 0 })
    if (results.affectedRows !== 1) return res.json({ status: 1, message: '添加失败！', affectedRows: 0 })
    res.json({ status: 0, message: '添加成功', affectedRows: results.affectedRows })
  })
})


// 绝对删除所有评论
router.get('/api/delcomments', (req, res) => {
  const sqlStr = 'truncate table comments'
  conn.query(sqlStr, (err, results) => {
    if (err) return res.json({ status: 1, message: '清空失败', affectedRows: 0 })
    res.json({ status: 0, message: '清空成功！', affectedRows: 0 })
  })
})

// end comments 


// start photos 

router.get('/api/getimgcategory', (req, res) => {
  // 定义Sql语句
  const sqlStr = 'select * from `imgs_class` where isdel=0'
  conn.query(sqlStr, (err, results) => {
    console.log(err)
    if (err) return res.json({ status: 1, message: '获取数据失败', affectedRows: 0 })
    res.json({ status: 0, message: results, affectedRows: 0 })
  })
})


router.get('/api/getimages/:class_id', (req, res) => {

  const class_id = req.params.class_id
  let sqlStr = ''
  // 定义Sql语句
  if (class_id != 0) {
    sqlStr = 'select * from `imgs_data` where class_id = ' + class_id + ''
  } else {
    sqlStr = 'select * from `imgs_data` where isdel = 0'
  }

  console.log(sqlStr)
  conn.query(sqlStr, (err, results) => {
    results.forEach(item => {
      if (item.img_url.length > 0) {
        item.img_url = 'http://' + baseURL + ':5000' + item.img_url
      }
    })
    console.log(err)
    if (err) return res.json({ status: 1, message: '获取数据失败', affectedRows: 0 })
    res.json({ status: 0, message: results, affectedRows: 0 })
  })
})
// 添加图片数据  
router.post('/api/addimg', (req, res) => {
  const img = req.body
  // 创建时间
  img.isdel = 0

  const sqlStr = 'insert into `imgs_data` set ?'
  conn.query(sqlStr, img, (err, results) => {
    if (err) return res.json({ status: 1, message: '添加失败！', affectedRows: 0 })
    if (results.affectedRows !== 1) return res.json({ status: 1, message: '添加失败！', affectedRows: 0 })
    res.json({ status: 0, message: '添加成功', affectedRows: results.affectedRows })
  })
})


// 根据ID获取缩略图数据
router.get('/api/getthumimages/:id', (req, res) => {
  const id = req.params.id

  const sqlStr = 'select * from `imgs_thumbs` where `thumbs_id`=?'

  conn.query(sqlStr, id, (err, results) => {
    results.forEach(item => {
      if (item.src.length > 0) {
        item.src = 'http://' + baseURL + ':5000' + item.src
      }
    })
    console.log(results.length)
    // 执行Sql语句失败
    if (err) return res.json({ status: 1, message: '获取所缩略图失败', affectedRows: 0 })
    // if (results.length !== 1) return res.json({ status: 1, message: '缩略图不存在！', affectedRows: 0 })
    res.json({
      status: 0,
      message: results,
      affectedRows: 0
    })
  })
})

// 根据ID获取图片信息
router.get('/api/getimageInfo/:id', (req, res) => {
  const id = req.params.id
  const sqlStr = 'select * from `imgs_info` where info_id=?'
  conn.query(sqlStr, id, (err, results) => {
    // 执行Sql语句失败
    if (err) return res.json({ status: 1, message: '获取缩略图信息失败', affectedRows: 0 })
    // if (results.length !== 1) return res.json({ status: 1, message: '缩略图信息不存在！', affectedRows: 0 })
    res.json({
      status: 0,
      message: results[0],
      affectedRows: 0
    })
  })
})

// 绝对删除所有图片
router.get('/api/delimgs', (req, res) => {
  const sqlStr = 'truncate table imgs_data'
  conn.query(sqlStr, (err, results) => {
    if (err) return res.json({ status: 1, message: '清空失败', affectedRows: 0 })
    res.json({ status: 0, message: '清空成功！', affectedRows: 0 })
  })
})

// end photos 

// start goods 

// 添加goods数据  
router.post('/api/addgood', (req, res) => {
  const good = req.body
  // 补全英雄的创建时间
  good.add_time = moment().format('YYYY-MM-DD HH:mm:ss')
  good.isdel = 0
  // console.log(news)
  const sqlStr = 'insert into goods set ?'
  conn.query(sqlStr, good, (err, results) => {
    if (err) return res.json({ status: 1, message: '添加goods！', affectedRows: 0 })
    if (results.affectedRows !== 1) return res.json({ status: 1, message: '添加goods失败！', affectedRows: 0 })
    res.json({ status: 0, message: '添加goods成功', affectedRows: results.affectedRows })
  })
})

// 分页获取所有未删除的goods
router.get('/api/getgoods', (req, res) => {

  let start = ((req.query.pageindex || 1) - 1) * 3

  const limit = req.query.limit || 3
  // 定义Sql语句
  const sqlStr = 'SELECT * FROM goods limit ' + start + ',' + limit + ' '
  const sqlStr2 = 'SELECT count(*) FROM goods'

  conn.query(sqlStr, (err1, results1) => {
    results1.forEach(item => {
      if (item.img_url.length > 0) {
        item.img_url = 'http://' + baseURL + ':5000' + item.img_url
      }
    })
    conn.query(sqlStr2, (err2, results2) => {
      if (err1) return res.json({ status: 1, message: '获取数据失败', affectedRows: 0 })
      res.json({ status: 0, count: results2[0]['count(*)'], message: results1, affectedRows: 0 })
    })
  })
})


// 根据id获取goods的信息
router.get('/api/goods/getinfo/:id', (req, res) => {
  const id = req.params.id
  const sqlStr = 'select * FROM `goods_info` where `goods_id` = ?'
  conn.query(sqlStr, id, (err, results) => {
    // 执行Sql语句失败
    if (err) return res.json({ status: 1, message: '获取缩略图信息失败', affectedRows: 0 })
    if (results.length !== 1) return res.json({ status: 1, message: '缩略图信息不存在！', affectedRows: 0 })
    res.json({
      status: 0,
      message: results[0],
      affectedRows: 0
    })
  })
})

// 根据id获取商品的图文介绍数据
router.get('/api/goods/getdesc/:id', (req, res) => {
  const id = req.params.id
  const sqlStr = 'select * from `good_desc` where `desc_id`=?'
  conn.query(sqlStr, id, (err, results) => {
    // 执行Sql语句失败
    if (err) return res.json({ status: 1, message: '获取缩略图信息失败', affectedRows: 0 })
    if (results.length !== 1) return res.json({ status: 1, message: '缩略图信息不存在！', affectedRows: 0 })
    res.json({
      status: 0,
      message: results[0],
      affectedRows: 0
    })
  })
})


// 根据id获取购物车数据
router.get('/api/goods/getshopcarlist/:ids', (req, res) => {
  const ids = req.params.ids
  const sqlStr = `select * from goods where id in (${ids})`
  conn.query(sqlStr, (err, results) => {
    // 执行Sql语句失败
    if (err) return res.json({ status: 1, message: '获取购物车数据失败', affectedRows: 0 })
    // if (results.length !== 1) return res.json({ status: 1, message: '获取的购物车数据不存在！', affectedRows: 0 })
    res.json({
      status: 0,
      message: results,
      affectedRows: 0
    })
  })
})


// end goods 

/* GET home page. */
router.get('/', function (req, res, next) {
  // res.render('index', { title: 'mall-service' }); 
  res.sendFile(path.join(__dirname, './index.html'))
});

// 测试接口数据
router.get('/getlist', function (req, res, next) {
  res.send([{ "name": "fly", "age": 18 }, { "name": "sky", "age": 28 }]);
});

module.exports = router;
