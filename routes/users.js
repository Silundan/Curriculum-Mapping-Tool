const express = require('express');
const bcrypt = require('bcrypt');
const saltRounds = 10;  
const tokenManager = require('./tokenManager');
const sanitizeHtml = require('sanitize-html');
const router = express.Router();


router.post('/reg', (req, res) => {

  let { email, password } = req.body;

  
  let query = "SELECT user_id FROM users WHERE email = ?";  

  req.pool.query(query, [email], (error, results) => {
      

      if (error) {
          
          res.status(500).json({ status: 'ERROR', message: 'Internal Server Error' });
          return;
      }

      if (results.length > 0) {
        
        res.json({ status: 'ERROR', message: "Email already registered." });
    } else {
        
        let hashedPassword = bcrypt.hashSync(password, saltRounds);
        console.log("reg, insert ", password, hashedPassword)
        let insertUserQuery = "INSERT INTO users (email, password) VALUES (?, ?)";

                
        req.pool.query(insertUserQuery, [email, hashedPassword], (insertError, insertResults) => {
            console.log("insert result----", insertError, insertResults);

            if (insertError) {
                res.status(500).json({ status: 'ERROR', message: 'Error while registering user.' });
                return;
            }
            
            
            res.json({ status: 'OK', user_id: insertResults.insertId });
        });
    }
  });
});




router.post('/login', (req, res) => {

  let { email, password } = req.body;

  
  let query = "SELECT user_id,email,password FROM users WHERE email = ?";  

  req.pool.query(query, [email], (error, results) => {
      if (error) {
          
          res.status(500).json({ status: 'ERROR', message: 'Internal Server Error' });
          return;
      }

      if (results.length > 0) {
          console.log(results)

          
          let hashedPassword = bcrypt.hashSync(password, saltRounds);
          console.log("login, fetch ", password, hashedPassword)
        
          fetch_password = results[0].password
          fetch_user_id = results[0].user_id
          fetch_email = results[0].email

          let isMatch = bcrypt.compareSync(password, fetch_password);

          if (isMatch) {           
            console.log("found", fetch_email, fetch_password, fetch_user_id);

            let token = tokenManager.generateToken();
            console.log("new token generated", token);
            tokenManager.storeToken(token, fetch_user_id);        
            res.cookie('userToken', token, { maxAge: 900000, httpOnly: true });

            res.json({ status: 'OK', user_id: fetch_user_id });
          } else {
            res.status(401).json({ status: 'ERROR', message: 'password incorrect' });
          }
      } else {
          
          console.log("not found");
          res.status(401).json({ status: 'ERROR', message: 'User not found' });
      }
  });
});

router.post('/addNewCourse', (req, res) => {
  var new_course_id = 0;
  let {degree_id, type, stream_id, course_code, course_name, courselink_href, units, terms} = req.body;
  if (isNaN(degree_id) || isNaN(type) || isNaN(stream_id) || isNaN(units) || isNaN(terms)) {
    res.sendStatus(400);
    return;
  }
  let query = "INSERT INTO course (stream_id, course_code, course_name, courselink_href, units, term) VALUES (?,?,?,?,?,?)";
  let sanCourseName = sanitizeHtml(course_name);
  course_name = sanCourseName.replace(/&amp;/g, '&');

  req.pool.query(query, [stream_id, sanitizeHtml(course_code), course_name, sanitizeHtml(courselink_href), units, terms], (error, results) => {
    if (error) {
      console.log(error.message);
      res.status(500).json({ error: error.message });
      return;
    }
    console.log(results.insertId);
    new_course_id = results.insertId;
    console.log(new_course_id);
    
    query = "INSERT INTO degree_course (degree_id, course_id, type) VALUES (?,?,?)";
    console.log(new_course_id);
    req.pool.query(query, [degree_id, new_course_id, type], (error, results, next) => {
      if (error) {
        console.log(error.message);
        res.status(500).json({ error: error.message });
        return;
      }
      res.sendStatus(200);
    });
  });

  // query = "INSERT INTO pre_requisite (src_course_id, target_course_id) VALUES (?,?)";
  // req.pool.query(query, [new_course_id, type], (error, results, next) => {
  //   if (error) {
  //     console.log(error.message);
  //     res.status(500).json({ error: error.message });
  //     return;
  //   } else {
  //     next;
  //   }
  // });

});

module.exports = router;