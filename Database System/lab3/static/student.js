const queryselect = document.getElementById("quert-select");
const studentid = document.getElementById("student-id");
const studentpersonid = document.getElementById("student-person-id");
const studentemail = document.getElementById("student-email");
const studentclass = document.getElementById("student-class");
const studentmajor = document.getElementById("student-major");
const studentenrollment = document.getElementById("student-enrollment");
const selectfilter = document.getElementById("select-filter");

queryselect.onchange = function () {
    if (queryselect.value === "delete") {
        studentid.classList.remove("display-none");
        studentid.classList.add("display-block");
        studentpersonid.classList.remove("display-block");
        studentpersonid.classList.add("display-none");
        studentemail.classList.remove("display-block");
        studentemail.classList.add("display-none");
        studentclass.classList.remove("display-block");
        studentclass.classList.add("display-none");
        studentmajor.classList.remove("display-block");
        studentmajor.classList.add("display-none");
        studentenrollment.classList.remove("display-block");
        studentenrollment.classList.add("display-none");
        selectfilter.classList.remove("display-block");
        selectfilter.classList.add("display-none");
    } else if (queryselect.value === "select") {
        studentid.classList.remove("display-block");
        studentid.classList.add("display-none");
        studentpersonid.classList.remove("display-block");
        studentpersonid.classList.add("display-none");
        studentemail.classList.remove("display-block");
        studentemail.classList.add("display-none");
        studentclass.classList.remove("display-block");
        studentclass.classList.add("display-none");
        studentmajor.classList.remove("display-block");
        studentmajor.classList.add("display-none");
        studentenrollment.classList.remove("display-block");
        studentenrollment.classList.add("display-none");
        selectfilter.classList.remove("display-none");
        selectfilter.classList.add("display-block");
    } else {
        studentid.classList.remove("display-none");
        studentid.classList.add("display-block");
        studentpersonid.classList.remove("display-none");
        studentpersonid.classList.add("display-block");
        studentemail.classList.remove("display-none");
        studentemail.classList.add("display-block");
        studentclass.classList.remove("display-none");
        studentclass.classList.add("display-block");
        studentmajor.classList.remove("display-none");
        studentmajor.classList.add("display-block");
        studentenrollment.classList.remove("display-none");
        studentenrollment.classList.add("display-block");
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
    new_opt.innerText = "ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "personal ID";
    new_opt.innerText = "personal ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "email";
    new_opt.innerText = "email";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "class";
    new_opt.innerText = "class";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "major";
    new_opt.innerText = "major";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "enrollment";
    new_opt.innerText = "enrollment";
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
    //document.getElementById("sel" + (i)).onchange = ChangeSel;
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
            break;
        case "personal ID":
            inp.setAttribute("type", "number");
            break;
        case "email":
            inp.setAttribute("type", "email");
            break;
        case "class":
            inp.setAttribute("type", "text");
            break;
        case "major":
            inp.setAttribute("type", "text");
            break;
        case "enrollment":
            inp.setAttribute("type", "date");
            break;
        default:
            inp.setAttribute("type", "text");
            break;
    }
}
