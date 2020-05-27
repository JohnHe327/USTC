const queryselect = document.getElementById("quert-select");
const teacherid = document.getElementById("teacher-id");
const teacherpersonid = document.getElementById("teacher-person-id");
const teacherentry = document.getElementById("teacher-entry");
const teacheremail = document.getElementById("teacher-email");
const teachermajor = document.getElementById("teacher-major");
const teacherrank = document.getElementById("teacher-rank");
const selectfilter = document.getElementById("select-filter");

queryselect.onchange = function () {
    if (queryselect.value === "delete") {
        teacherid.classList.remove("display-none");
        teacherid.classList.add("display-block");
        teacherpersonid.classList.remove("display-block");
        teacherpersonid.classList.add("display-none");
        teacherentry.classList.remove("display-block");
        teacherentry.classList.add("display-none");
        teacheremail.classList.remove("display-block");
        teacheremail.classList.add("display-none");
        teachermajor.classList.remove("display-block");
        teachermajor.classList.add("display-none");
        teacherrank.classList.remove("display-block");
        teacherrank.classList.add("display-none");
        selectfilter.classList.remove("display-block");
        selectfilter.classList.add("display-none");
    } else if (queryselect.value === "select") {
        teacherid.classList.remove("display-block");
        teacherid.classList.add("display-none");
        teacherpersonid.classList.remove("display-block");
        teacherpersonid.classList.add("display-none");
        teacherentry.classList.remove("display-block");
        teacherentry.classList.add("display-none");
        teacheremail.classList.remove("display-block");
        teacheremail.classList.add("display-none");
        teachermajor.classList.remove("display-block");
        teachermajor.classList.add("display-none");
        teacherrank.classList.remove("display-block");
        teacherrank.classList.add("display-none");
        selectfilter.classList.remove("display-none");
        selectfilter.classList.add("display-block");
    } else {
        teacherid.classList.remove("display-none");
        teacherid.classList.add("display-block");
        teacherpersonid.classList.remove("display-none");
        teacherpersonid.classList.add("display-block");
        teacherentry.classList.remove("display-none");
        teacherentry.classList.add("display-block");
        teacheremail.classList.remove("display-none");
        teacheremail.classList.add("display-block");
        teachermajor.classList.remove("display-none");
        teachermajor.classList.add("display-block");
        teacherrank.classList.remove("display-none");
        teacherrank.classList.add("display-block");
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
    new_opt.value = "entry";
    new_opt.innerText = "entry date";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "email";
    new_opt.innerText = "email";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "major";
    new_opt.innerText = "major ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "rank";
    new_opt.innerText = "rank";
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
        case "personal ID":
            inp.setAttribute("type", "number");
            inp.placeholder = "";
            break;
        case "entry":
            inp.setAttribute("type", "date");
            inp.placeholder = "";
            break;
        case "email":
            inp.setAttribute("type", "email");
            inp.placeholder = "";
            break;
        case "major":
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
        case "rank":
            inp.setAttribute("type", "text");
            inp.placeholder = "professor/assistant";
            break;
        default:
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
    }
}
