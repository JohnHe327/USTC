const queryselect = document.getElementById("quert-select");
const classid = document.getElementById("class-id");
const classname = document.getElementById("class-name");
const classcreatedate = document.getElementById("class-create-date");
const classteacher = document.getElementById("class-teacher");
const classgrade = document.getElementById("class-grade");
const classmajor = document.getElementById("class-major");
const selectfilter = document.getElementById("select-filter");

queryselect.onchange = function () {
    if (queryselect.value === "delete") {
        classid.classList.remove("display-none");
        classid.classList.add("display-block");
        classname.classList.remove("display-block");
        classname.classList.add("display-none");
        classcreatedate.classList.remove("display-block");
        classcreatedate.classList.add("display-none");
        classteacher.classList.remove("display-block");
        classteacher.classList.add("display-none");
        classgrade.classList.remove("display-block");
        classgrade.classList.add("display-none");
        classmajor.classList.remove("display-block");
        classmajor.classList.add("display-none");
        selectfilter.classList.remove("display-block");
        selectfilter.classList.add("display-none");
    } else if (queryselect.value === "select") {
        classid.classList.remove("display-block");
        classid.classList.add("display-none");
        classname.classList.remove("display-block");
        classname.classList.add("display-none");
        classcreatedate.classList.remove("display-block");
        classcreatedate.classList.add("display-none");
        classteacher.classList.remove("display-block");
        classteacher.classList.add("display-none");
        classgrade.classList.remove("display-block");
        classgrade.classList.add("display-none");
        classmajor.classList.remove("display-block");
        classmajor.classList.add("display-none");
        selectfilter.classList.remove("display-none");
        selectfilter.classList.add("display-block");
    } else {
        classid.classList.remove("display-none");
        classid.classList.add("display-block");
        classname.classList.remove("display-none");
        classname.classList.add("display-block");
        classcreatedate.classList.remove("display-none");
        classcreatedate.classList.add("display-block");
        classteacher.classList.remove("display-none");
        classteacher.classList.add("display-block");
        classgrade.classList.remove("display-none");
        classgrade.classList.add("display-block");
        classmajor.classList.remove("display-none");
        classmajor.classList.add("display-block");
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
    new_opt.innerText = "class ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "name";
    new_opt.innerText = "class name";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "createdate";
    new_opt.innerText = "create date";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "headteacher";
    new_opt.innerText = "head teacher";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "grade";
    new_opt.innerText = "grade";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "major";
    new_opt.innerText = "major";
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
        case "name":
            inp.setAttribute("type", "text");
            break;
        case "createdate":
            inp.setAttribute("type", "date");
            break;
        case "headteacher":
            inp.setAttribute("type", "text");
            break;
        case "grade":
            inp.setAttribute("type", "number");
            break;
        case "major":
            inp.setAttribute("type", "text");
            break;
        default:
            inp.setAttribute("type", "text");
            break;
    }
}
