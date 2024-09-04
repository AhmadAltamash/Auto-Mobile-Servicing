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

function search(){
    let details = document.querySelector(".search-filter input");
    let icon = document.querySelector(".search-filter i");
    const tableRows = document.querySelectorAll("tbody tr");

    icon.style.display = "none";

    details.addEventListener('input', searchTable)
    function searchTable(){
        tableRows.forEach((row, i)=>{
            icon.style.display = "block";
            let tableData = row.textContent.toLowerCase(), searchData = details.value.toLowerCase();

            row.classList.toggle('hide', tableData.indexOf(searchData)<0)
            row.style.setProperty('--delay', i/25 + 's')
            if(tableData.indexOf(searchData)>0)
            {
                icon.addEventListener("click",()=>{
                    details.value = "";
                    row.classList.remove('hide')
                    icon.style.display = "none"
                })
            }
        })
        document.querySelectorAll("tbody tr:not(.hide)").forEach((visibleRows, i)=>{
            visibleRows.style.backgroundColor = (i % 2 == 0) ? '#f6f6f6a4': 'rgba(255, 255, 255, 0.782)';
        })
    }
}

function formdisplay(){
    let show = document.querySelector(".addPlans");
    let display = document.querySelector(".addPlansForm");
    show.addEventListener("click",()=>{
        display.style.display = "block";
    })
}

function cal(){
    let charge = document.querySelector("#charge");
    let discount = document.querySelector("#disc");
    let total = document.querySelector("#total");

    charge.addEventListener("input", calculateTotal);
    discount.addEventListener("input", calculateTotal);

    function calculateTotal() {
        let chargeValue = parseFloat(charge.value);
        let discountValue = parseFloat(discount.value);

        if (!isNaN(chargeValue) && !isNaN(discountValue)) {
            total.value = chargeValue - (chargeValue * (discountValue / 100));
        } else {
            total.value = ""; // Clear the total if inputs are invalid
        }
    }
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

function pageShow(){
    let show = document.querySelector(".history");
    let page = document.querySelector(".page2");

    show.addEventListener("click",()=>{
        page.style.display = "block";
    })
}

pageShow()
bgclick()
cal()
formdisplay()
search()
navBar()