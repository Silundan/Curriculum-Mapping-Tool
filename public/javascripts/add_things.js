function doAJAX(container, target_loc) {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            if (req.response) {
                console.log("Success");
                console.log(req.response);
            } else {
                console.log("Fail");
            }
        } else if (req.readyState === 4 && req.status === 400) {
            console.log(req.response);
        } else if (req.readyState === 4 && req.status !== 200){
            console.log("Error saving data to the database. Status: " + req.status);
        }
    }
    req.open("POST", target_loc);
    req.setRequestHeader('Content-Type', 'application/json');
    req.send(JSON.stringify(container));
}

function addNewCourse() {
    let degree_id = document.getElementById('degree').value;
    let type = 0;
    if (document.getElementById('core').checked) {
        type += 1;
    }
    if (document.getElementById('elective').checked) {
        type += 2;
    }
    if (document.getElementById('project').checked) {
        type += 4;
    }

    // Adding course
    let stream_id = document.getElementById('stream').value;
    let course_code = document.getElementById('course_code').value;
    let course_name = document.getElementById('course_name').value;
    let courselink_href = document.getElementById('courselink_href').value;
    let units = document.getElementById('units').value;
    let terms = document.getElementById('terms').value;

    let container = {degree_id, type, stream_id, course_code, course_name, courselink_href, units, terms};

    doAJAX(container, "/users/addNewCourse");

}
