import { Controller } from "@hotwired/stimulus"
import * as Tone from 'tone'


// Connects to data-controller="logo-animation"
export default class extends Controller {
  connect() {
    function showSlides() {

      let pS = document.querySelectorAll("h5");
      for (let i = 0; i < pS.length; i++) {
          pS[i].style.display = "none";
      }

      pS[slideIndex].style.display = "block";
      if (slideIndex < pS.length-1) {
        slideIndex++;
      }
      else if(slideIndex == pS.length-1) {
        slideIndex = 0;
      }

      setTimeout(showSlides, 8000);
    };

    let slideIndex = 0;
    showSlides();

    const sampler = new Tone.Sampler({
      urls: {
        "C4": "C4.mp3",
        "D#4": "Ds4.mp3",
        "F#4": "Fs4.mp3",
        "A4": "A4.mp3",
      },
      release: 1,
      baseUrl: "https://tonejs.github.io/audio/salamander/",
    }).toDestination();

    Tone.loaded().then(() => {
      sampler.triggerAttackRelease(["Eb4", "G4", "Bb4"], 4);
    })
    const acceptBtn = document.getElementById('soundpop');
    acceptBtn.addEventListener('click', sampler);
    const acceptBtno = document.getElementById('soundpopper');
    acceptBtno.addEventListener('click', sampler);
    const acceptBtnon = document.getElementById('soundpoppers');
    acceptBtno.addEventListener('click', sampler);




  }
}
