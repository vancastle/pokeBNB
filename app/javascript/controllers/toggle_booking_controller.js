import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-booking"
export default class extends Controller {
  static targets = ["togglableElement"];

  connect() {
    // connect method logic
  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
