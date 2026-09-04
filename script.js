function scene(tab) {

    const tabs = document.getElementsByClassName("tab");

    for (let i = 0; i < tabs.length; i++) {
        tabs[i].classList.remove("active");
    }

    tabs[tab].classList.add("active");
}