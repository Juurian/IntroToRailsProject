document.addEventListener('DOMContentLoaded', function() {
  document.addEventListener('click', function(event) {
    var target = event.target;
    if (target && target.classList.contains('buy-button')) {
      var url = target.getAttribute('data-url');
      window.open(url, '_blank'); // This opens the link in a new tab/window
    }
  });
});
