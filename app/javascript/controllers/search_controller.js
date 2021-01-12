import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  // Read more about targets in the Stimulus reference guide: https://stimulusjs.org/reference/targets
  static targets = ["searchTerm", "searchResults"]

  // The connect lifecycle method runs each time our controller is connected to the DOM
  // Read more about lifecycle methods in the Stimulus reference guide: https://stimulusjs.org/reference/lifecycle-callbacks
  connect() {
  }

  getWeather(zip, units = 'imperial') {
    fetch(`/weather/search?zip_code=${zip}&units=${units}`, {
      method: 'GET',
      headers: {
        'Accept': 'application/html',
        'Content-Type': 'application/html'
      }
    })
    .then((response) => response.text())
    .then((html) => {
      this.searchResultsTarget.innerHTML = html;
      this.searchTermTarget.value = '';
    }
    )
    .catch((error) => {
      console.error('Error:', error);
    });
  }

  searchWeather() {
    var zip = this.searchTermTarget.value;
    this.getWeather(zip)
  }

  searchSavedWeather(event) {
    var zip = $(event.currentTarget).data('id');
    this.getWeather(zip);
  }

  toggleFarenheit(event) {
    event.preventDefault();
    var zip = $(event.currentTarget).data('id');
    event.currentTarget.parentElement.classList.toggle('active');
    this.getWeather(zip, 'imperial');
  }

  toggleCelcius(event) {
    event.preventDefault();
    var zip = $(event.currentTarget).data('id');
    event.currentTarget.parentElement.classList.toggle('active');
    this.getWeather(zip, 'metric');
  }
}
