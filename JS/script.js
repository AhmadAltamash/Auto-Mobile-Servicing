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

function slider(){
    let list = document.querySelector(".slider .list")
    let items = document.querySelectorAll(".slider .list .item")
    let dots = document.querySelectorAll(".slider .dots li")
    let prev = document.getElementById('prev')
    let next = document.getElementById('next')

let active = 0
let lengthItems = items.length - 1;


next.addEventListener("click", ()=>{
    if(active + 1 > lengthItems)
    {
        active = 0
    }
    else
    {
        active = active + 1; 
    }
    slidereload()
})
prev.addEventListener("click", ()=>{
    if(active -1 < 0)
    {
        active = lengthItems
    }
    else
    {
        active = active - 1 
    }
    slidereload()
})


let refreshSlider = setInterval(()=>{next.click()},5000)
function slidereload()
{
    let checkleft = items[active].offsetLeft;
    list.style.left = -checkleft + 'px'
    
    let lastActiveDots = document.querySelector('.slider .dots li.active ')
    lastActiveDots.classList.remove('active')
    dots[active].classList.add('active')
    clearInterval(refreshSlider)
    refreshSlider = setInterval(()=>{next.click()},5000)
}
dots.forEach((li, key)=>{
    li.addEventListener("click", ()=>{
        active = key  
        slidereload()
    })  
})
}

function bgclick(){
    let nav = document.querySelectorAll(".nav-content a");
    nav.forEach(item=>{
        item.addEventListener("click", function(){
           
           nav.forEach(link => link.classList.remove("activated"));

           this.classList.add("activated");
        })
    })
}
function loader() {
    let loader = document.querySelector('.terminal-parent');
    loader.style.bottom = '100%'; 
    setTimeout(() => {
        loader.style.display = 'none'; 
        document.body.classList.remove('no-scroll'); 
    }, 1000);
}

window.onload = () => {
    document.body.classList.add('no-scroll');
    setTimeout(() => {
        loader();
    }, 1000);
}

slider()
bgclick()
navBar()