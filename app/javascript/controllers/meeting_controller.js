import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="meeting"
export default class extends Controller {
  static targets = ["adminBtn"]
  static values = {
    isAdmin: Boolean
  }

  connect() {
    // if (!this.isAdminValue) return;

    // this.adminBtnTargets.forEach(t => t.classList.remove("d-none"))
  }

  adminBtnTargetConnected(element) {
    if (!this.isAdminValue) return;

    element.classList.remove('d-none');
  }

}
