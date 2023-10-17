import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="current-year"
export default class extends Controller {
  static targets = ["year"]

  connect() {
    console.log("Controller is connected");
    const currentYear = new Date().getFullYear();
    console.log("Current Year:", currentYear);
    this.yearTarget.textContent = currentYear;
  }
}
