
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

function notify(){
    function showNotification() {
        const notification = document.getElementById('notification');
        notification.classList.add('show'); 
    
        setTimeout(() => {
            notification.classList.remove('show');
            localStorage.removeItem('showNotification');
        }, 10000);
    }
    
    window.onload = function() {
        if (localStorage.getItem('showNotification') === 'true') {
            showNotification();
        }
    };
    
    // Handle the submit button click event
    document.getElementById('submit').addEventListener('click', function() {
        localStorage.setItem('showNotification', 'true');
    });    
}

function insertDate() {
    let date = document.querySelector("#dateInput");
    let dateDisplay = document.querySelector(".insertDate");
    
    date.addEventListener("input", () => {
        let selectedDate = date.value;
        let reversedDate = selectedDate.split('-').reverse().join('');
        dateDisplay.textContent = reversedDate;
    });
}


insertDate()
notify()
currtime()
navBar()