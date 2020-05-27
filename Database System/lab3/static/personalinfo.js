const queryselect = document.getElementById("quert-select");
const infoid = document.getElementById("info-id");
const infotype = document.getElementById("info-type");
const infoname = document.getElementById("info-name");
const infogender = document.getElementById("info-gender");
const infobirthday = document.getElementById("info-birthday");
const infonational = document.getElementById("info-nationality");
const infoaddr = document.getElementById("info-address");
const infopostcode = document.getElementById("info-postcode");
const infophone = document.getElementById("info-phone");
const selectfilter = document.getElementById("select-filter");

queryselect.onchange = function () {
    if (queryselect.value === "delete") {
        infoid.classList.remove("display-none");
        infoid.classList.add("display-block");
        infotype.classList.remove("display-block");
        infotype.classList.add("display-none");
        infoname.classList.remove("display-block");
        infoname.classList.add("display-none");
        infogender.classList.remove("display-block");
        infogender.classList.add("display-none");
        infobirthday.classList.remove("display-block");
        infobirthday.classList.add("display-none");
        infonational.classList.remove("display-block");
        infonational.classList.add("display-none");
        infoaddr.classList.remove("display-block");
        infoaddr.classList.add("display-none");
        infopostcode.classList.remove("display-block");
        infopostcode.classList.add("display-none");
        infophone.classList.remove("display-block");
        infophone.classList.add("display-none");
        selectfilter.classList.remove("display-block");
        selectfilter.classList.add("display-none");
    } else if (queryselect.value === "select") {
        infoid.classList.remove("display-block");
        infoid.classList.add("display-none");
        infotype.classList.remove("display-block");
        infotype.classList.add("display-none");
        infoname.classList.remove("display-block");
        infoname.classList.add("display-none");
        infogender.classList.remove("display-block");
        infogender.classList.add("display-none");
        infobirthday.classList.remove("display-block");
        infobirthday.classList.add("display-none");
        infonational.classList.remove("display-block");
        infonational.classList.add("display-none");
        infoaddr.classList.remove("display-block");
        infoaddr.classList.add("display-none");
        infopostcode.classList.remove("display-block");
        infopostcode.classList.add("display-none");
        infophone.classList.remove("display-block");
        infophone.classList.add("display-none");
        selectfilter.classList.remove("display-none");
        selectfilter.classList.add("display-block");
    } else {
        infoid.classList.remove("display-none");
        infoid.classList.add("display-block");
        infotype.classList.remove("display-none");
        infotype.classList.add("display-block");
        infoname.classList.remove("display-none");
        infoname.classList.add("display-block");
        infogender.classList.remove("display-none");
        infogender.classList.add("display-block");
        infobirthday.classList.remove("display-none");
        infobirthday.classList.add("display-block");
        infonational.classList.remove("display-none");
        infonational.classList.add("display-block");
        infoaddr.classList.remove("display-none");
        infoaddr.classList.add("display-block");
        infopostcode.classList.remove("display-none");
        infopostcode.classList.add("display-block");
        infophone.classList.remove("display-none");
        infophone.classList.add("display-block");
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
    new_opt.innerText = "personal info ID";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "type";
    new_opt.innerText = "information type";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "name";
    new_opt.innerText = "name";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "gender";
    new_opt.innerText = "gender";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "birthday";
    new_opt.innerText = "birthday";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "nationality";
    new_opt.innerText = "nationality";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "addr";
    new_opt.innerText = "address";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "postcode";
    new_opt.innerText = "postcode";
    new_sel.appendChild(new_opt);
    new_opt = document.createElement("option");
    new_opt.value = "phone";
    new_opt.innerText = "phone";
    new_sel.appendChild(new_opt);
    new_div.appendChild(new_sel);
    new_div.appendChild(document.createTextNode(" = "));
    // input text
    new_inp = document.createElement("input");
    new_inp.type = "number";
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
            inp.setAttribute("type", "number");
            inp.placeholder = "";
            break;
        case "type":
            inp.setAttribute("type", "text");
            inp.placeholder = "creditcard/passport";
            break;
        case "name":
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
        case "gender":
            inp.setAttribute("type", "text");
            inp.placeholder = "male/female";
            break;
        case "birthday":
            inp.setAttribute("type", "date");
            inp.placeholder = "";
            break;
        case "nationality":
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
        case "addr":
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
        case "postcode":
            inp.setAttribute("type", "number");
            inp.placeholder = "";
            break;
        case "phone":
            inp.setAttribute("type", "number");
            inp.placeholder = "";
            break;
        default:
            inp.setAttribute("type", "text");
            inp.placeholder = "";
            break;
    }
}
