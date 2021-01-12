import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  // Read more about targets in the Stimulus reference guide: https://stimulusjs.org/reference/targets
  static targets = ["zip", "name"]

  // The connect lifecycle method runs each time our controller is connected to the DOM
  // Read more about lifecycle methods in the Stimulus reference guide: https://stimulusjs.org/reference/lifecycle-callbacks
  connect() {
  }

  save() {
    fetch(`/saved_locations?saved_location[zip_code]=${this.zipTarget.innerHTML}&saved_location[name]=${this.nameTarget.innerHTML}`, {
      method: 'POST',
      headers: {
        'Accept': 'application/javascript',
        'Content-Type': 'application/javascript'
      }
    })
    .then((response) => response.text())
    .then((html) => {
      $('#savedLocations').prepend(html);
      $('#saveSearch').text("Saved!");
    }
    )
    .catch((error) => {
      console.error('Error:', error);
    });
  }


}
