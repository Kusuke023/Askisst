//パッケージの読み込み
const express = require('express');
const mysql = require('mysql');
const session = require('express-session');

const app = express();

app.use(express.static('public'));  //静的ファイル(public)の読み込み


app.get('/', (req, res) => {
    res.render('index.ejs');
});

app.get('/job', (req, res) => {
    connection.query(
        'SELECT * FROM rquest',
        (error, results) => {
            res.render('job.ejs', { rquests: results });
        }
    );

});

app.get('/ask', (req, res) => {
    res.render('ask.ejs');
})

app.get('/signup', (req, res) => {
    res.render('signup.ejs');
});


app.get('/signin', (req, res) => {
    res.render('signin.ejs');
});

app.post('/signin', (req, res) => {
    const email = req.body.email;
    connection.query(
        'SELECT * FROM users WHERE email = ?',
        [email],
        (error, results) => {
            if (results.length > 0) {
                if (req.body.password === results[0].password) {
                    console.log('認証に成功しました');
                    res.redirect('/');
                } else {
                    console.log('認証に失敗しました');
                    res.redirect('/signin');
                }
            }
        }
    )
});

app.get('/inquiry', (req, res) => {
    res.render('inquiry.ejs');
});

app.get('/kiyaku', (req, res) => {
    res.render('kiyaku.ejs');
});

app.get('/pr', (req, res) => {
    res.render('pr.ejs');
});

app.get('/application', (req, res) => {
    res.render('application.ejs');
});

// app.listen(3000);

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'Askisst',
    password: 'ask',
    port : 3308, //portを確認することを忘れずに
    database: 'AskisstDB'
  });
  
  connection.connect((err) => {
    if (err) {
      console.log('error connecting: ' + err.stack);
      return;
    }
    console.log('success');
  });
  