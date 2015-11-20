var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/mp4', function(req, res, next) {
  res.download("/testfile.mp4");
});

module.exports = router;
