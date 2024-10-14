function navBar(){
    let menu = document.querySelector(".menu")
    let close = document.querySelector(".close")
    let nav_Content = document.querySelector(".nav-content")
    let parentNav = document.querySelector(".parent-nav")
menu.addEventListener("click", ()=>{
    nav_Content.style.display = "flex"
    menu.style.display = "none";
    close.style.display = "block"
    parentNav.style.paddingTop = ".6em"
})
close.addEventListener("click", ()=>{
    nav_Content.style.display = "none"
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