import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["voteSection", "resultSection"];

  hideVoteSection(event) {
    event.preventDefault()
    this.voteSectionTarget.classList.add("d-none");
    this.resultSectionTarget.classList.remove("d-none");
  }
}
