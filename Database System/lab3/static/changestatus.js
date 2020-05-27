const queryselect = document.getElementById("quert-select");
const changeid = document.getElementById("change-id");
const changedate = document.getElementById("change-date");
const origclassid = document.getElementById("orig-class-id");
const currclassid = document.getElementById("curr-class-id");
const changetype = document.getElementById("change-type");
const studentid = document.getElementById("student-id");
const changedetail = document.getElementById("change-detail");
const selectfilter = document.getElementById("select-filter");

queryselect.onchange = function () {
    if (queryselect.value === "delete") {
        changeid.classList.remove("display-none");
        changeid.classList.add("display-block");
        changedate.classList.remove("display-block");
        changedate.classList.add("display-none");
        origclassid.classList.remove("display-block");
        origclassid.classList.add("display-none");
        currclassid.classList.remove("display-block");
        currclassid.classList.add("display-none");
        changetype.classList.remove("display-block");
        changetype.classList.add("display-none");
        studentid.classList.remove("display-block");
        studentid.classList.add("display-none");
        changedetail.classList.remove("display-block");
        changedetail.classList.add("display-none");
        selectfilter.classList.remove("display-block");
        selectfilter.classList.add("display-none");
    } else if (queryselect.value === "select") {
        changeid.classList.remove("display-block");
        changeid.classList.add("display-none");
        changedate.classList.remove("display-block");
        changedate.classList.add("display-none");
        origclassid.classList.remove("display-block");
        origclassid.classList.add("display-none");
        currclassid.classList.remove("display-block");
        currclassid.classList.add("display-none");
        changetype.classList.remove("display-block");
        changetype.classList.add("display-none");
        studentid.classList.remove("display-block");
        studentid.classList.add("display-none");
        changedetail.classList.remove("display-block");
        changedetail.classList.add("display-none");
        selectfilter.classList.remove("display-none");
        selectfilter.classList.add("display-block");
    } else {
        changeid.classList.remove("display-none");
        changeid.classList.add("display-block");
        changedate.classList.remove("display-none");
        changedate.classList.add("display-block");
        origclassid.classList.remove("display-none");
        origclassid.classList.add("display-block");
        currclassid.classList.remove("display-none");
        currclassid.classList.add("display-block");
        changetype.classList.remove("display-none");
        changetype.classList.add("display-block");
        studentid.classList.remove("display-none");
        studentid.classList.add("display-block");
        changedetail.classList.remove("display-none");
        changedetail.classList.add("display-block");
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
    new_opt.value = "changeid";
    new_opt.selected = "selected";
    new_opt.innerText = "change ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "date";
    new_opt.innerText = "change date";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "orig";
    new_opt.innerText = "original class ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "curr";
    new_opt.innerText = "current class ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "type";
    new_opt.innerText = "change type";
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
        case "changeid":
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
        case "date":
            inp.setAttribute("type", "date");
            inp.placeholder = "";
            break;
        case "orig":
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
        case "curr":
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
        case "type":
            inp.setAttribute("type", "text");
            inp.placeholder = "专业/年级";
            break;
        default:
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
    }
}

var type_sel = document.getElementById("section_seme_inp");
var detail_inp = document.getElementById("change_detail_inp");
var detail_prompt = detail_inp.previousSibling.previousSibling;
type_sel.onchange = function () {
    if (type_sel.value === "专业") {
        detail_prompt.innerText = "change league member: ";
        detail_inp.placeholder = "是/否/不是团员";
    } else {
        detail_prompt.innerText = "change reason: ";
        detail_inp.placeholder = "休学/支教";
    }
}
