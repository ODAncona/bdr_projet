/**
 * Script to load dynamic content
 */
console.log("dynamic content sript loaded");
const buttons = document.querySelectorAll(".btn-filter");
buttons.forEach((element) => {
  element.addEventListener("click", (event) => {
    fetch("/tables?ajax=true&table=" + event.target.id)
      .then((response) => {
        return response.text();
      })
      .then((text) => {
        const elem = document.querySelector("#bgrd-table");
        if (elem !== null && elem !== undefined) {
            elem.innerHTML = text;
        } else {
          
        }
      });
  });
});
