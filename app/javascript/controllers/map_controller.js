import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }
  connect() {
    // console.log('hello')
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });
    this.#addMarkersToMap()
    // this.#fitMapToMarkers()
  }

  #addMarkersToMap(){

    // console.log(this.markerValue.lat)

      const popup = new mapboxgl.Popup().setHTML(this.markerValue.info_window_html)
      new mapboxgl.Marker()
      .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
      .setPopup(popup)
      .addTo(this.map)
  }

  // #fitMapToMarkers(){
  //   const bounds = new mapboxgl.LngLatBounds()
  //   this.markerValue.forEach(marker => bounds.extend([ marker.lng, marker.lat]))
  //   this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0})
  // }
}
