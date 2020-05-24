const queryselect = document.getElementById("quert-select");
const courseid = document.getElementById("course-id");
const coursename = document.getElementById("course-name");
const coursemajor = document.getElementById("course-major");
const courseeval = document.getElementById("course-eval");
const selectfilter = document.getElementById("select-filter");

queryselect.onchange = function () {
    if (queryselect.value === "delete") {
        courseid.classList.remove("display-none");
        courseid.classList.add("display-block");
        coursename.classList.remove("display-block");
        coursename.classList.add("display-none");
        coursemajor.classList.remove("display-block");
        coursemajor.classList.add("display-none");
        courseeval.classList.remove("display-block");
        courseeval.classList.add("display-none");
        selectfilter.classList.remove("display-block");
        selectfilter.classList.add("display-none");
    } else if (queryselect.value === "select") {
        courseid.classList.remove("display-block");
        courseid.classList.add("display-none");
        coursename.classList.remove("display-block");
        coursename.classList.add("display-none");
        coursemajor.classList.remove("display-block");
        coursemajor.classList.add("display-none");
        courseeval.classList.remove("display-block");
        courseeval.classList.add("display-none");
        selectfilter.classList.remove("display-none");
        selectfilter.classList.add("display-block");
    } else {
        courseid.classList.remove("display-none");
        courseid.classList.add("display-block");
        coursename.classList.remove("display-none");
        coursename.classList.add("display-block");
        coursemajor.classList.remove("display-none");
        coursemajor.classList.add("display-block");
        courseeval.classList.remove("display-none");
        courseeval.classList.add("display-block");
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
    new_opt.value = "ID";
    new_opt.selected = "selected";
    new_opt.innerText = "course ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "name";
    new_opt.innerText = "course name";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "major";
    new_opt.innerText = "major ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "eval";
    new_opt.innerText = "evaluation method";
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
        case "ID":
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
        case "name":
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
        case "major":
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
        case "eval":
            inp.setAttribute("type", "text");
            inp.placeholder = "考试/答辩";
            break;
        default:
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
    }
}
