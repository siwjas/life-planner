import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "btnOpen", "btnClose"]

  connect() {
    this.closeMenu()
  }

  toggleMenu() {
    if (this.menuTarget.classList.contains('hidden')) {
      this.openMenu()
    } else {
      this.closeMenu()
    }
  }

  openMenu() {
    this.menuTarget.classList.remove('hidden')
    this.menuTarget.classList.add('flex')

    this.btnOpenTarget.classList.add('hidden')
    this.btnOpenTarget.classList.remove('bock')

    this.btnCloseTarget.classList.remove('hidden')
    this.btnCloseTarget.classList.add('block')
  }

  closeMenu() {
    this.menuTarget.classList.add('hidden')
    this.menuTarget.classList.remove('flex')

    this.btnCloseTarget.classList.add('hidden')
    this.btnCloseTarget.classList.remove('block')

    this.btnOpenTarget.classList.add('block')
    this.btnOpenTarget.classList.remove('hidden')
  }
}