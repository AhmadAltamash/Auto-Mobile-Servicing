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

function dnloadbtn(){
    let invoice= document.querySelector(".invoice");
    let downloadbutton = document.querySelector(".btdownload");
    invoice.addEventListener("mouseenter",()=>{
        downloadbutton.style.display = "block";
    })
}

function pdfDnload(){
    let dnbtn = document.querySelector(".btdownload");
    let bill = document.querySelector(".invoice");


    function toPdf(bill){

        const html = `
            <link rel="stylesheet" href="../CSS/biling.css">
            <main class="main">${bill.innerHTML}</main
        `


        const newWindow = window.open();
        newWindow.document.write(html)
        setTimeout(()=>{
            newWindow.print();
            newWindow.close();
        },200)
       
    }

    dnbtn.addEventListener("click",()=>{
        toPdf(bill);
    })
}

pdfDnload()
dnloadbtn()
evaluate()
navBar()