import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["element"];

  toggle(event) {
    event.preventDefault();
    this.elementTargets.forEach((element) => {
      element.classList.toggle("hidden")
      element.classList.toggle("block")
    });
  }
}
