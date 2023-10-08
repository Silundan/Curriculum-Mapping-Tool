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

function deleteCourse() {
    let course_id = document.getElementById('course_id').value;
    let container = {course_id};
    doAJAX(container, "/users/deleteCourse");
}