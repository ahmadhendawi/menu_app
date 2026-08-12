import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { delay: Number }

  connect() {
    this.timeout = setTimeout(() => this.dismiss(), this.delayValue)
  }

  disconnect() {
    clearTimeout(this.timeout)
  }

  dismiss() {
    this.element.remove()
  }
}
