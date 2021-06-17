import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr("#range_start", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#range_end"})],
    minDate: "today",
  onClose: (selectedDates, dateStr, instance) => {
      const daysInRange = document.getElementsByClassName('inRange');
      const daysLengthTotal = daysInRange.length + 1;
      const daysField = document.getElementById('length-of-stay');
      const totalPriceField = document.getElementById('total-price')
      daysField.innerText = daysLengthTotal;
      totalPriceField.innerText = daysLengthTotal * totalPriceField.dataset.price;
    }
  });
}

export { initFlatpickr };

