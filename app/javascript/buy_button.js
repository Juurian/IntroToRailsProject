document.addEventListener('DOMContentLoaded', function() {
  var buyButtons = document.querySelectorAll('.buy-button');

  buyButtons.forEach(function(button) {
    button.addEventListener('click', function() {
      var url = this.dataset.url;
      window.open(url, '_blank');
    });
  });
});