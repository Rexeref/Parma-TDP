const express = require("express");
const multer = require("multer");
const path = require("path");
const mysql = require("mysql");
const app = express();
const bodyParser = require("body-parser");
const FileSystem = require("fs");

app.set("view engine", "pug");
app.set("views", "./views");

// Configurazione connessione DBMS
var con = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
});

// Configurazione di multer
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./uploads/");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + "-" + file.originalname);
  },
});

const upload = multer({ storage: storage }).single("cover_image");

app.use(express.static("public"));
app.use("/uploads", express.static(path.join(__dirname, "/uploads")));
app.use(bodyParser.urlencoded({ extended: true }));

var data = [
    crumb = "example",
    gino = "example"
]

app.get("/", (req, res) => {
  res.render("home", { data });
});

app.get("/style/:filename", (req, res) => {
    res.sendFile(path.join(__dirname, "public/css/", req.params.filename));
});

app.get("/script/:filename", (req, res) => {
    res.sendFile(path.join(__dirname, "public/js/", req.params.filename));
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
app.listen(3000, () => {
  console.log("Server avviato su http://localhost:3000");
});
