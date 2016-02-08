 $(document).ready(function(){
   $('.carousel').carousel({
  interval: 4000
  });
   setTimeout(function() {
    $('.alert').slideUp();
  }, 6000);
  });
