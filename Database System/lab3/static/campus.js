const queryselect = document.getElementById("quert-select");
const campusid = document.getElementById("campus-id");
const campusname = document.getElementById("campus-name");
const campusaddr = document.getElementById("campus-addr");
const selectfilter = document.getElementById("select-filter");

queryselect.onchange = function () {
    if (queryselect.value === "delete") {
        campusid.classList.remove("display-none");
        campusid.classList.add("display-block");
        campusname.classList.remove("display-block");
        campusname.classList.add("display-none");
        campusaddr.classList.remove("display-block");
        campusaddr.classList.add("display-none");
        selectfilter.classList.remove("display-block");
        selectfilter.classList.add("display-none");
    } else if (queryselect.value === "select") {
        campusid.classList.remove("display-block");
        campusid.classList.add("display-none");
        campusname.classList.remove("display-block");
        campusname.classList.add("display-none");
        campusaddr.classList.remove("display-block");
        campusaddr.classList.add("display-none");
        selectfilter.classList.remove("display-none");
        selectfilter.classList.add("display-block");
    } else {
        campusid.classList.remove("display-none");
        campusid.classList.add("display-block");
        campusname.classList.remove("display-none");
        campusname.classList.add("display-block");
        campusaddr.classList.remove("display-none");
        campusaddr.classList.add("display-block");
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
    new_opt.innerText = "campus ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "name";
    new_opt.innerText = "campus name";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "addr";
    new_opt.innerText = "campus address";
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
    i++;
}
