import flatpickr from 'flatpickr';


const toggleDateInputs = function () {
  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');

  if (startDateInput && endDateInput) {
    const unvailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable)

    flatpickr(startDateInput, {
      minDate: 'today',
      dateFormat: 'd-m-Y',
      disable: unvailableDates,
      onChange: function (selectedDates, selectedDate) {
        if (selectedDate === '') {
          costs.classList.remove('is-visible');
          endDateInput.disabled = true;
        }
        let minDate = selectedDates[0];
        minDate.setDate(minDate.getDate() + 1);
        endDateCalendar.set('minDate', minDate);
        endDateInput.disabled = false;
      }
    });
    const endDateCalendar =
      flatpickr(endDateInput, {
        dateFormat: 'd-m-Y',
        disable: unvailableDates,
        onChange: function (_, selectedDate) {
          if (selectedDate === '') {
            costs.classList.remove('is-visible');
          } else {
            let startDate = parseDate(startDateInput.value);
            let endDate = parseDate(endDateInput.value);
            let hours = Math.ceil((endDate - startDate) / (1000 * 3600 * 24)) * 6;
            updateCosts(hours);
            costs.classList.add('is-visible');
          }
        },
      });
  }
};

export { toggleDateInputs }
