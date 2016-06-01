"use strict";

console.log(mov.length);

var tbody = document.querySelector("tbody");
var thHouse = document.querySelector("#house-header");
var thStateRegion = document.querySelector("#state-region-header");
var thConstituency = document.querySelector("#constituency-header");
var thMov = document.querySelector("#mov-header");

function createTableCell(value) {
    var td = document.createElement("TD");
    td.textContent = value;
    return td;
}

function addRow(record) {
    /*
        this creates:
        <tr>
            <td>country name</td>
            <td>life expect 2013</td>
        </tr>
    */
    var tr = document.createElement("TR");
    tr.appendChild(createTableCell(record.House));
    tr.appendChild(createTableCell(record.State_Region));
    tr.appendChild(createTableCell(record.Constituency_Recode_Max));
    tr.appendChild(createTableCell(record.MarginOfVictory));
    tbody.appendChild(tr);
}

function populateTable() {
    tbody.innerHTML = "";
    mov.forEach(addRow);
}

function compareByMOV(r1, r2) {
    return -(r1.MarginOfVictory - r2.MarginOfVictory);
}

function compareByStateReg(r1,r2) {
    return r1.State_Region.localeCompare(r2.State_Region);
}

function compareByConstituency(r1,r2) {
    return r1.Constituency_Recode_Max.localeCompare(r2.Constituency_Recode_Max);
}

function compareByHouse(r1,r2) {
    return r1.House.localeCompare(r2.House);
}

mov.sort(compareByMOV);
populateTable();


thStateRegion.addEventListener("click", function () {
    mov.sort(compareByStateReg);
    populateTable();
});


thConstituency.addEventListener("click", function () {
    mov.sort(compareByConstituency);
    populateTable();
});

thHouse.addEventListener("click", function () {
    mov.sort(compareByHouse);
    populateTable();
});

thMov.addEventListener("click", function () {
    mov.sort(compareByMOV);
    populateTable();
});