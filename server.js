//
//// Configurazione Server
//

const express = require("express");
const multer = require("multer");
const path = require("path");
const mysql = require("mysql");
const app = express();
const bodyParser = require("body-parser");
const FileSystem = require("fs");

// Pug
app.set("view engine", "pug");
app.set("views", "./views");

// connessione DBMS
var con = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_DB,
});

// multer
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./uploads/");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + "-" + file.originalname);
  },
});

const upload = multer({ storage: storage }).single("cover_image");
app.use(express.json())
app.use(express.static("public"));
app.use("/uploads", express.static(path.join(__dirname, "public/img/photos")));
app.use(bodyParser.urlencoded({ extended: true }));
;

//
//// Gestione Richieste
//

app.get("/style/:filename", (req, res) => {
    res.sendFile(path.join(__dirname, "public/css/", req.params.filename));
});

app.get("/script/:filename", (req, res) => {
    res.sendFile(path.join(__dirname, "public/js/", req.params.filename));
});

app.get("/image/:filename", (req, res) => {
    res.sendFile(path.join(__dirname, "public/img/", req.params.filename));
});

app.get("/article/:crumb", (req, res) => {
    var data = {
        crumb: req.params.crumb,
        type: "article",
        randinfos: []
    };

    con.query("SELECT a.image, a.title, a.title_cardarticolo, a.subtitle_cardarticolo, a.description_cardarticolo, a.article, a.coords_X, a.coords_Y, c.name as category, r.image as icon, r.information, r.label FROM article a INNER JOIN category c ON(c.ID = a.category_ID) INNER JOIN article_randinfo ar ON(a.ID = ar.article_ID ) INNER JOIN randinfo r ON(r.ID = ar.randinfo_ID) WHERE a.crumb = ?", [req.params.crumb], 
        (err, result) => {
            if (err) {
                console.error('Failed to retrieve article details:', err);
                res.status(500).send('Database query error');
                return;
            }
            //console.log(result);
            data.randinfos = result;
            res.render("article", { data, pretty : true });
        });
});

app.post("/question", (req, res) => {
  const { name, email, subject, message } = req.body;
  
  const sql = "INSERT INTO questions (name, email, title, content) VALUES (?, ?, ?, ?)";
  con.query(sql, [name, email, subject, message], (err, result) => {
      if (err) {
          console.error('Failed to insert question:', err);
          res.status(500).send('Database query error');
          return;
      }
      res.redirect("/");
  });
});

app.get("/", (req, res) => {
    var data = {
        crumb: "Home",
        title: "Home",
        type: "home",
        articles: []
    };

    con.query("SELECT * FROM article", (err, result) => {
        if (err) {
            console.error('Failed to retrieve articles:', err);
            res.status(500).send('Database query error');
            return;
        }
        data.articles = result;
        res.render("home", { data, pretty : true });
    });
});

/*
app.get("/posts/:id", (req, res) => {
  const postId = parseInt(req.params.id);
  const post = posts.find((post) => post.id === postId);
  res.render("post", { post });
});

app.get("/admin", (req, res) => {
  res.render("admin", { posts });
});

app.get("/admin/modify/:id", (req, res) => {
  const postId = parseInt(req.params.id);
  const post = posts.find((post) => post.id === postId);
  res.render("mod-post", { post });
});

app.post("/admin/posts_modify/:id", (req, res) => {
  const { title, content } = req.body;
  const postId = parseInt(req.params.id);
  const index = posts.findIndex((post) => post.id === postId);
  posts[index].title = title;
  posts[index].content = content;
  savePosts();
  res.redirect("/");
});

app.post("/comment/:id", (req, res) => {
  const { comment } = req.body;
  const postId = parseInt(req.params.id);
  const index = posts.findIndex((post) => post.id === postId);
  posts[index].comments.push(comment);
  res.redirect("/posts/" + postId);
});

app.post("/admin/posts_add", upload, (req, res) => {
  const { title, content } = req.body;
  const newPost = {
    id: posts.length + 1,
    title,
    comments: [],
    cover_image: req.file ? req.file.filename : null,
    content,
  };

  posts.unshift(newPost);
  savePosts();
  res.redirect("/");
});

app.get("/admin/new", (req, res) => {
  res.render("add-post");
});

app.get("/admin/delete/:id", (req, res) => {
  const postId = parseInt(req.params.id);
  const postIndex = posts.findIndex((post) => post.id === postId);
  if (postIndex !== -1) {
    posts.splice(postIndex, 1);
  }
  savePosts();
  res.redirect("/admin");
});
*/

//
//// Avvio Server
//

app.listen(3000, () => {
  console.log("Server avviato su http://localhost:3000");
});
