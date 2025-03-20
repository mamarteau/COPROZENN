import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="floor"
export default class extends Controller {
  static targets = ["appartment", "userInfosContainer", "floorsContainer", "floorNumber"]

  connect() {
    this.currentFloor = 1;
  }

  change(event) {
    this.appartmentTargets.forEach(t => t.setAttribute("fill", "white"));
    event.currentTarget.setAttribute("fill", "#fe6363");
    const appartmentId = event.currentTarget.id;
    fetch(`/user_infos?appartment_id=${appartmentId}`, {
      headers: {
        'Accept': "application/json"
      }
    })
    .then(response => response.json())
    .then(data => {
      this.userInfosContainerTarget.innerHTML = data.html;
    })
  }

  displayFloor() {
    const firstFloor = this.floorsContainerTarget.querySelector("div");
    firstFloor.style.marginLeft = `-${(this.currentFloor - 1) * 100}%`;
    this.floorNumberTarget.innerText = this.currentFloor;
  }

  previousFloor(event) {
    if (this.currentFloor === 1) return;

    this.currentFloor -= 1;
    this.displayFloor()
  }

  nextFloor(event) {
    if (this.currentFloor === 3) return;

    this.currentFloor += 1;
    this.displayFloor();
  }
}
