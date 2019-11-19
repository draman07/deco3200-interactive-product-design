class FacePointsDisplay {
  constructor() {
    console.log('face points display');
    const facePoints = document.getElementById('face-points');
    facePoints.classList.add('Display__Active');
  }

  reset(...args) {
    console.log(args);
  }
}

export default FacePointsDisplay;
