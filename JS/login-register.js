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

function display() {
    let loginPage = document.querySelector(".container-login");
    let rsgtrPageOpen = document.querySelector(".register");
    let rsgtrPage = document.querySelector(".container-register");
    let lognOpen = document.querySelector(".login");
    
    rsgtrPageOpen.addEventListener("click", () => {
        
        loginPage.style.transform = "translateX(-100%)";
        rsgtrPage.style.transform = "translateX(0%)";
    });

    lognOpen.addEventListener("click", () => {
      
        loginPage.style.transform = "translateX(0%)";
        rsgtrPage.style.transform = "translateX(100%)";
    });
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

function passwordViewer2(){
    let password = document.querySelector(".password");
    let open = document.querySelector(".open2");
    let close = document.querySelector(".close3");

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
passwordViewer2()
display()
navBar()