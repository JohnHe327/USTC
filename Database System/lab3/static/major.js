const queryselect = document.getElementById("quert-select");
const majorid = document.getElementById("major-id");
const majorname = document.getElementById("major-name");
const majoraddr = document.getElementById("major-addr");
const majorcampus = document.getElementById("major-campus");
const majorleader = document.getElementById("major-leader");
const selectfilter = document.getElementById("select-filter");

queryselect.onchange = function () {
    if (queryselect.value === "delete") {
        majorid.classList.remove("display-none");
        majorid.classList.add("display-block");
        majorname.classList.remove("display-block");
        majorname.classList.add("display-none");
        majoraddr.classList.remove("display-block");
        majoraddr.classList.add("display-none");
        majorcampus.classList.remove("display-block");
        majorcampus.classList.add("display-none");
        majorleader.classList.remove("display-block");
        majorleader.classList.add("display-none");
        selectfilter.classList.remove("display-block");
        selectfilter.classList.add("display-none");
    } else if (queryselect.value === "select") {
        majorid.classList.remove("display-block");
        majorid.classList.add("display-none");
        majorname.classList.remove("display-block");
        majorname.classList.add("display-none");
        majoraddr.classList.remove("display-block");
        majoraddr.classList.add("display-none");
        majorcampus.classList.remove("display-block");
        majorcampus.classList.add("display-none");
        majorleader.classList.remove("display-block");
        majorleader.classList.add("display-none");
        selectfilter.classList.remove("display-none");
        selectfilter.classList.add("display-block");
    } else {
        majorid.classList.remove("display-none");
        majorid.classList.add("display-block");
        majorname.classList.remove("display-none");
        majorname.classList.add("display-block");
        majoraddr.classList.remove("display-none");
        majoraddr.classList.add("display-block");
        majorcampus.classList.remove("display-none");
        majorcampus.classList.add("display-block");
        majorleader.classList.remove("display-none");
        majorleader.classList.add("display-block");
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
    new_opt.value = "name";
    new_opt.innerText = "name";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "addr";
    new_opt.innerText = "address";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "campus";
    new_opt.innerText = "campus ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "leader";
    new_opt.innerText = "major leader";
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
