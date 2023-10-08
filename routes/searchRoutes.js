
const express = require('express');
const sanitizeHtml = require('sanitize-html');
const router = express.Router();


router.get('/search', (req, res) => {
    const query = sanitizeHtml(req.query['course-name'] || req.query['degree-name'] || req.query['all-categories']).trim();

    console.log("Sanitized search query:", query);

    if (!query) {
        return res.status(400).json({ error: "Search query cannot be empty." });
    }

    req.pool.query('SELECT stream_id FROM course_stream WHERE stream_name LIKE ?', [`%${query}%`], (err, streamResults) => {
        if (err) {
            console.error("Error querying course streams:", err.message);  
            return res.status(500).json({ error: err.message });
        }

        console.log("Stream results:", streamResults);

        if (streamResults.length > 0) {
            req.pool.query('SELECT * FROM course WHERE stream_id = ?', [streamResults[0].stream_id], (err, courseResults) => {
                if (err) {
                    console.error("Error querying courses:", err.message);  
                    return res.status(500).json({ error: err.message });
                }
                console.log("Courses found for stream:", courseResults);
                res.json({ courses: courseResults, degrees: [] });
            });
        } else {
            console.log("No matching stream found, proceeding to normal search.");
            req.pool.query('SELECT * FROM course WHERE course_name LIKE ? OR course_code LIKE ?', [`%${query}%`, `%${query}%`], (err, courseResults) => {
                if (err) {
                    console.error("Error querying courses:", err.message);  
                    return res.status(500).json({ error: err.message });
                }
                req.pool.query('SELECT * FROM degree WHERE name_suffix LIKE ?', [`%${query}%`], (err, degreeResults) => {
                    if (err) {
                        console.error("Error querying degrees:", err.message);  
                        return res.status(500).json({ error: err.message });
                    }
                    console.log("Courses and degrees found:", courseResults, degreeResults);
                    res.json({ courses: courseResults, degrees: degreeResults });
                });
            });
        }
    });
});

module.exports = router;

