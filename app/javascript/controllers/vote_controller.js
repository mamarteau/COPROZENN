import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["voteSection", "resultSection", "openVote"];

  hideVoteSection(event) {
    event.preventDefault()
    this.voteSectionTarget.classList.add("d-none");
    this.resultSectionTarget.classList.remove("d-none");
  }

  openVote(event) {
    event.preventDefault()
    this.openVoteTarget.classList.remove("d-none")
  }
}
