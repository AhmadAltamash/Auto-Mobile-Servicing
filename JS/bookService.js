
function currtime() {
    let currentTime = document.querySelector("#currentTime");
    let date = new Date();

    let hours = date.getHours();
    let minutes = date.getMinutes();
    let seconds = date.getSeconds();


    let ampm = hours >= 12 ? 'PM' : 'AM';

    hours = hours % 12;
    hours = hours ? hours : 12;
    
    minutes = minutes.toString().padStart(2, '0');
    seconds = seconds.toString().padStart(2, '0');

    let timeString = `${hours}:${minutes}:${seconds} ${ampm}`;

    currentTime.value = timeString;
}
setInterval(()=>{
    currtime();
},1000)
window.onload = function() {
    currtime();
};

document.getElementById("dateInput").addEventListener("change", function() {
    const dateValue = this.value;
    const date = new Date(dateValue);
    let spanColor = document.querySelector(".daySpan")

    if (!isNaN(date.getTime())) {
        const options = { weekday: 'long' };
        const dayName = date.toLocaleDateString('en-US', options);
        document.getElementById("dayOutput").value = dayName;
        spanColor.style.color = "green";
        spanColor.style.top = "30px";
        spanColor.style.fontSize = "0.7em";
        spanColor.style.fontWeight = "600";
    } else {
        document.getElementById("dayOutput").value = '';
        spanColor.style.color = "grey";
    }
});

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

currtime()
navBar()