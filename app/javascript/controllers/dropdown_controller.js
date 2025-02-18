import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = [ "button", "menu" ]

  connect() {
    this.close()
  }

  toggle(){
    this.menuTarget.classList.contains('hidden') ? this.open() : this.close()
  }

  hide(e) {
    const buttonClicked = this.buttonTarget.contains(e.target)
    if(!buttonClicked) {
      this.close()
    }
  }

  open() {
    this.menuTarget.classList.remove('hidden')
  }

  close() {
    this.menuTarget.classList.add('hidden')
  }
}
