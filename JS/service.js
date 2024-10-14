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
            total.value = Math.floor(chargeValue - (chargeValue * (discountValue / 100)));
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
profile()
bgclick()
cal()
formdisplay()
search()
navBar()