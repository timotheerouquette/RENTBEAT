import swal from 'sweetalert';
export { initSweetalert };
export { Sweetalert };

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options);
    });
  }
};




const Sweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.getElementById('fake-btn');
  if (swalButton) {
    const dates = document.getElementById('range_start')
    const price = document.getElementById('total-price')
    swalButton.addEventListener('click', (event) => {
      swal({
        title: "Your booking",
        text: `From ${dates.value}

        Estimated price: ${price.innerText}€`,
        icon: "info",
        closeOnClickOutside: false,
        closeOnEsc: false,
        dangerMode: false,
        buttons: ["Cancel", "Confirm"]
      }).then((value) => {
        if (value) {
          const link = document.querySelector('#sweet-alert-booking');
          link.click();
    }
  });
  }
)}
  }
