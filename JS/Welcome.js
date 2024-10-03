
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


function profile(){
    let showMore = document.querySelector(".nav-content .more");
    let links = document.querySelector(".multiple-links");

    showMore.addEventListener("mouseover", () => {
        links.style.display = "flex";
    });

    links.addEventListener("mouseleave", () => {
        links.style.display = "none";
    });
}

profile()
navBar()