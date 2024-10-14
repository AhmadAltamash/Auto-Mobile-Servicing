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

function passwordViewer1(){
    let password = document.getElementById("password");
    let open = document.querySelector(".open");
    let close = document.querySelector(".close2");

    open.addEventListener("click", ()=>{
        password.type = "text";
        open.style.display = "none";
        close.style.display = "block";
    })
    close.addEventListener("click", ()=>{
        password.type = "password";
        open.style.display = "block";
        close.style.display = "none";
    })
}

passwordViewer1()
navBar()