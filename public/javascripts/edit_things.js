function doEditAJAX(container, target_loc) {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            if (req.response) {
                alert("Successfully saved the changes into database!");
                location.reload();
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

function commitEditCourse() {
    let stream_id = document.getElementById('stream_id').value;
    if (isNaN(stream_id) || stream_id < 0 || stream_id === null || stream_id === "") {
        alert('Invalid stream!');
        return;
    }
    let course_id = document.getElementById('course_id').value;
    if (isNaN(course_id) || course_id < 0 || course_id === null || course_id === "") {
        alert('Invalid course!');
        return;
    }
    let course_name = document.getElementById('course_name').value;
    if (course_name === "" || course_name === null) {
        alert('Invalid course name!');
        return;
    }
    let courselink_href = document.getElementById('courselink_href').value;
    if (courselink_href === "" || courselink_href === null) {
        alert('Invalid course link!');
        return;
    }
    let units = document.getElementById('units').value;
    if (units === "" || units === null) {
        alert('Invalid course units!');
        return;
    }
    let term = document.getElementById('terms').value;
    if (isNaN(term) || term < 0 || term === null || term === "") {
        alert('Invalid course term!');
        return;
    }
    if (confirm("Do you really want to update:\n"+ vuectrl.stream[vuectrl.courseCode[vuectrl.courseID].stream_id].stream_name +" "+ vuectrl.courseCode[vuectrl.courseID].course_code+"\n"+vuectrl.courseCode[vuectrl.courseID].course_name +"?") === true) {
        let container = {course_id, stream_id, course_name, courselink_href, units, term};
        doEditAJAX(container, "/users/editCourse");
    }
}