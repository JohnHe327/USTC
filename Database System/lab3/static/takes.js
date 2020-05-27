const queryselect = document.getElementById("quert-select");
const studentid = document.getElementById("student-id");
const courseid = document.getElementById("course-id");
const teacherid = document.getElementById("teacher-id");
const sectionyear = document.getElementById("section-year");
const sectionseme = document.getElementById("section-seme");
const takesgrade = document.getElementById("takes-grade");
const selectfilter = document.getElementById("select-filter");

queryselect.onchange = function () {
    if (queryselect.value === "delete") {
        studentid.classList.remove("display-none");
        studentid.classList.add("display-block");
        courseid.classList.remove("display-none");
        courseid.classList.add("display-block");
        teacherid.classList.remove("display-block");
        teacherid.classList.add("display-none");
        sectionyear.classList.remove("display-block");
        sectionyear.classList.add("display-none");
        sectionseme.classList.remove("display-block");
        sectionseme.classList.add("display-none");
        takesgrade.classList.remove("display-block");
        takesgrade.classList.add("display-none");
        selectfilter.classList.remove("display-block");
        selectfilter.classList.add("display-none");
    } else if (queryselect.value === "select") {
        studentid.classList.remove("display-block");
        studentid.classList.add("display-none");
        courseid.classList.remove("display-block");
        courseid.classList.add("display-none");
        teacherid.classList.remove("display-block");
        teacherid.classList.add("display-none");
        sectionyear.classList.remove("display-block");
        sectionyear.classList.add("display-none");
        sectionseme.classList.remove("display-block");
        sectionseme.classList.add("display-none");
        takesgrade.classList.remove("display-block");
        takesgrade.classList.add("display-none");
        selectfilter.classList.remove("display-none");
        selectfilter.classList.add("display-block");
    } else {
        studentid.classList.remove("display-none");
        studentid.classList.add("display-block");
        courseid.classList.remove("display-none");
        courseid.classList.add("display-block");
        teacherid.classList.remove("display-none");
        teacherid.classList.add("display-block");
        sectionyear.classList.remove("display-none");
        sectionyear.classList.add("display-block");
        sectionseme.classList.remove("display-none");
        sectionseme.classList.add("display-block");
        takesgrade.classList.remove("display-none");
        takesgrade.classList.add("display-block");
        selectfilter.classList.remove("display-block");
        selectfilter.classList.add("display-none");
    }
}

var i = 1;
var new_div, new_sel, new_opt, new_inp;
const btn = document.getElementById("add-filter-btn");
btn.onclick = function () {
    // div
    new_div = document.createElement("div");
    // logic selection
    new_sel = document.createElement("select");
    new_sel.name = "logic" + i;
    new_sel.id = "logic" + i;
    new_opt = document.createElement("option");
    new_opt.value = "or";
    new_opt.selected = "selected";
    new_opt.innerText = "或";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "and";
    new_opt.innerText = "且";
    new_sel.appendChild(new_opt);
    new_div.appendChild(new_sel);
    // type selection
    new_sel = document.createElement("select");
    new_sel.name = "sel" + i;
    new_sel.id = "sel" + i;
    new_opt = document.createElement("option");
    new_opt.value = "studentid";
    new_opt.selected = "selected";
    new_opt.innerText = "student ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "courseid";
    new_opt.innerText = "course ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "teacherid";
    new_opt.innerText = "teacher ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "year";
    new_opt.innerText = "year";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "seme";
    new_opt.innerText = "semester";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "grade";
    new_opt.innerText = "grade";
    new_sel.appendChild(new_opt);
    new_div.appendChild(new_sel);
    new_div.appendChild(document.createTextNode(" = "));
    // input text
    new_inp = document.createElement("input");
    new_inp.type = "text";
    new_inp.name = "subclause" + i;
    new_inp.id = "subclause" + i;
    new_div.appendChild(new_inp);
    selectfilter.appendChild(new_div);
    document.getElementById("sel" + i).addEventListener("change", function () { ChangeSel(this) });
    i++;
}

function ChangeSel(val) {
    var inp = val.nextSibling;
    while (inp.nodeType != 1)
        inp = inp.nextSibling;
    switch (val.value) {
        case "studentid":
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
        case "courseid":
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
        case "teacherid":
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
        case "year":
            inp.setAttribute("type", "number");
            inp.placeholder = "";
            break;
        case "seme":
            inp.setAttribute("type", "text");
            inp.placeholder = "春/秋";
            break;
        case "grade":
            inp.setAttribute("type", "number");
            inp.placeholder = "";
            break;
        default:
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
    }
}
