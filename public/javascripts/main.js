// TODO:
// Impliment degree courses, pre_requisites, incompatibles
// free to use the arrays in vue for form input
const MAX_COURSES_PER_TERM = 5;


const vuectrl = Vue.createApp({
    data() {
        return {
            stream: [],
            level: [],
            course: [],
            degree: [],
            searchQuery: '',
            degree_course: [],
            type: ["core", "elective","core & elective", "project", "core & project", "elective & project", "core, elective & project"],
            term: {
                0: {t: 0, s: ""},
                1: {t: 1, s: "Semester 1"},
                2: {t: 2, s: "Semester 2"},
                3: {t: 3, s: "All Semesters"},
                4: {t: 4, s: "Trimester 1"},
                5: {t: 5, s: "Trimester 2"},
                6: {t: 6, s: "Trimester 3"},
                7: {t: 7, s: "All Trimesters"}
            },
            unit: ["3", "6", "9"],
            pre_requisites: [],
            incompatibles: [],
            matchedCourses: [], 
            studyPlan: {
                1: { 1: [], 2: [], 3: []},
                2: { 1: [], 2: [], 3: []},
                3: { 1: [], 2: [], 3: []}
            },
            
            errorMessage: null,
            displayDegree: true,
            displayCourse: false,
            selectedYear: 1,
            selectedTerm: 1,
            sid: -1,
            cid: -1,
            courseCode: [],
            courseID: -1,
            currentPage: 1,     
            itemsPerPage: 5,   
            currentList: 'degree',
        };
    },

    computed: {
        totalItemsPages() {
            return Math.ceil(this.currentItems.length / this.itemsPerPage);
        },

        currentItems() {
            if (this.currentList === 'degree') {
                return this.degree;
            } else {
                return this.course;
            }
        },
    
        paginatedItems() {
            const start = (this.currentPage - 1) * this.itemsPerPage;
            const end = start + this.itemsPerPage;
            return this.currentItems.slice(start, end);
        }
    },
    
    methods: {
        toggleDisplay(type) {
            if (type === 'degree') {
                this.displayDegree = true;
                this.displayCourse = false;
                this.currentList = 'degree';
            } else if (type === 'course') {
                this.displayDegree = false;
                this.displayCourse = true;
                this.currentList = 'course';
            }
            this.currentPage = 1;

        },
        
        doSearching() {
            const searchQuery = this.searchQuery.trim(); 
            const searchScope = document.getElementById("demo-label").value;
            if (searchQuery) {
                let apiUrl = ''; 
        
                switch (searchScope) {
                    case 'get_courses':
                        apiUrl = `/api/courses?keyword=${searchQuery}`;
                        break;
                    case 'get_Degrees':
                        apiUrl = `/api/search?degree-name=${searchQuery}`;  
                        break;
                    default:
                        apiUrl = `/api/search?all-categories=${searchQuery}`;  
                        break;
                }
        
                fetch(apiUrl)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error("Network response was not ok");
                        }
                        return response.json();
                    })
                    .then(data => {
                        if (searchScope === 'get_courses') {
                            this.course = data;  
                        } else if (searchScope === 'get_Degrees') {
                            this.degree = data.degrees; 
                        } else {
                            
                            this.course = data.courses;  
                            this.degree = data.degrees;  
                        }
                    })
                    .catch(error => {
                        console.error("Error fetching search results:", error);
                    });
            } else {
                alert("Please enter a search.");
            }
        },
       
        nextPage() {
            if(this.currentPage < this.totalItemsPages) {
                this.currentPage++;
            }
        },

        prevPage() {
            if(this.currentPage > 1) {
                this.currentPage--;
            }
        },

        switchList(listName) {   
            this.currentList = listName;
            this.currentPage = 1;  
        },
        
        searchCourses() {
            console.log("Search method called");
            const searchQuery = this.searchQuery.trim();
            if (searchQuery) {
                
                const apiUrl = `/api/courses?keyword=${searchQuery}`;
                
                fetch(apiUrl)
                    .then(response => response.json())
                    .then(data => {
                        this.matchedCourses = data || [];
                    })
                    .catch(error => {
                        console.error("Error fetching search results:", error);
                    });
            } else {
                alert("search course here。");
            }
        },
        

        addToPlan() {
            let coursesAlreadyInPlan = [];
            if (!this.selectedYear || !this.selectedTerm) {
                alert('Please select a year, term and courses.');
                return;
            }
            
            const selectedCourses = this.matchedCourses.filter(course => course.selected);
            
            if (!selectedCourses.length) {
                alert('Please select courses to add to the study plan.');
                return;
            }
        
            const targetTermCourses = this.studyPlan[this.selectedYear][this.selectedTerm];
        
            selectedCourses.forEach(course => {
                if (targetTermCourses.length < MAX_COURSES_PER_TERM) {
                    
                    if (!targetTermCourses.some(c => c.course_code === course.course_code)) {
                        targetTermCourses.push({
                            course_code: course.course_code,
                            course_name: course.course_name,
                        });
                    } else {
                        coursesAlreadyInPlan.push(course.course_code);
                    }
                } else {
                    alert(`Study plan is full for Year ${this.selectedYear}, Term ${this.selectedTerm}. Not all courses added.`);
                    return;
                }
            });
        
            if (coursesAlreadyInPlan.length > 0) {
                alert('Courses ' + coursesAlreadyInPlan.join(', ') + ' are already in Year ' + this.selectedYear + ', Term ' + this.selectedTerm + '.');
            } else {
                alert(`Courses added to Year ${this.selectedYear}, Term ${this.selectedTerm}.`);
            }
        },
        downloadPDF() {
            console.log("Download button clicked");
            const { jsPDF } = window.jspdf;
            const mainDiv = document.querySelector(".study-plan");
         
        
            html2canvas(mainDiv, {
                scale: 2,  
                useCORS: true,  
            }).then(canvas => {
                const imgData = canvas.toDataURL('image/png');
                

                const pdf = new jsPDF({
                    orientation: "portrait",
                    unit: "mm",
                    format: "a4"
                });
        
                const imgProps= pdf.getImageProperties(imgData);
                const pdfWidth = pdf.internal.pageSize.getWidth();
                const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;
                pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
                pdf.save('study_plan.pdf');
            });
        },

        removeCourse(year, term, courseCode) {
            this.studyPlan[year][term] = this.studyPlan[year][term].filter(course => course.course_code !== courseCode);
        },
        
        doLogin() {
            console.log("login...");
            window.location.href = "login.html";
        },
        
        
        dataUpdate(){
            vuectrl.fetchData("/api/course_streams", "stream");
            vuectrl.fetchData("/api/degree_levels", "level");
            vuectrl.fetchData("/api/courses", "course");
            vuectrl.fetchData("/api/degrees", "degree");
            // vuectrl.fetchData("/api/degree_courses", "degree_course");
            // vuectrl.fetchData("/api/pre_requisites", "pre_requisite");
            // vuectrl.fetchData("/api/incompatibles", "incompatibles");
        },
        formStreamChange() {
            vuectrl.courseCode.length = 0;
            for (let i=0; i<vuectrl.course.length; i++) {
                if (vuectrl.course[i].stream_id === vuectrl.sid) {
                    vuectrl.courseCode.push(vuectrl.course[i]);
                }
            }
        },
        getCourseID() {
            vuectrl.cid = document.getElementById('course_id').value;
            for (let i=0; i<vuectrl.courseCode.length; i++){
                if (vuectrl.courseCode[i].course_id == vuectrl.cid) {
                    vuectrl.courseID = i;
                    break;
                }
            }
        },

        fetchData(target_loc, dest_var){
            let req = new XMLHttpRequest();
            req.onreadystatechange = function () {
                if (req.readyState === 4 && req.status === 200) {
                    if (req.response) {
                        vuectrl[dest_var] = JSON.parse(req.response);
                    }
                } else if (req.readyState === 4 && req.status !== 200) {
                    vuectrl.errorMessage = "Error fetching data from " + target_loc + ". Status: " + req.status;
                }
            };
            req.open("GET", target_loc);
            req.send();
        }
    }
}).mount('#mainDiv');

vuectrl.dataUpdate();

function keepAlive() {
    setInterval(vuectrl.dataUpdate, 60000); // ms
    console.log("Auto reloaded.");

}



keepAlive();

