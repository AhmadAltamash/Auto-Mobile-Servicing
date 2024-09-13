function navBar(){
    let menu = document.querySelector(".menu")
let close = document.querySelector(".close")
let navContent = document.querySelectorAll(".nav-content a")
menu.addEventListener("click", ()=>{
    navContent.forEach(item =>{
        item.style.display = "flex";
    })
    menu.style.display = "none";
    close.style.display = "block"
})
close.addEventListener("click", ()=>{
    navContent.forEach(item =>{
        item.style.display = "none";
    })
    menu.style.display = "block";
    close.style.display = "none"
})
}

function evaluate(){
    let total = document.querySelector("#sum");
    let num = document.querySelectorAll(".price");
    let sum = 0;
    num.forEach(item =>{
        sum += parseFloat(item.textContent);
    })
    total.value = sum;
}
evaluate()
navBar()