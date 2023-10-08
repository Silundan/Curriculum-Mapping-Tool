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
    let stream_id = document.getElementById('stream_id').value;
    if (isNaN(stream_id) || stream_id < 0 || stream_id === null || stream_id === "") {
        alert('Invalid stream!');
        return;
    }
    let course_id = document.getElementById('course_id').value;
    console.log(course_id);
    if (isNaN(course_id) || course_id < 0 || course_id === null || course_id === "") {
        alert('Invalid course!');
        return;
    }
    if (confirm("Do you really want to delete:\n"+ vuectrl.stream[vuectrl.courseCode[course_id].stream_id].stream_name +" "+ vuectrl.courseCode[course_id].course_code+"\n"+vuectrl.courseCode[course_id].course_name +"?") === true) {
        let container = {course_id, stream_id};
        doAJAX(container, "/users/deleteCourse");
    }
}