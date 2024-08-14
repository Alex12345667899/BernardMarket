import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      dateFormat: "d-m-Y",
      locale: {
        firstDayOfWeek: 1
      },
      minDate: "today",
      dateFormat: "Y-m-d",
    });

    // flatpickr(this.element, {
    //   dateFormat: "d-m-Y",
    //   locale: {
    //     firstDayOfWeek: 1
    //   }
    // });
  }
}
