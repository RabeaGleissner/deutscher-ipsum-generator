WebFontConfig = {
   google: { families: [ 'Roboto::latin' ] }
 };
 (function() {
   var wf = document.createElement('script');
   wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
     '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
   wf.type = 'text/javascript';
   wf.async = 'true';
   var s = document.getElementsByTagName('script')[0];
   s.parentNode.insertBefore(wf, s);
 })();


$(function() {

  setTimeout(function() {
    console.log('timeout');
    $('#footer-background').addClass('display');
  }, 2000);


    $('#user-selection').on('submit', function(ev) {
        ev.preventDefault();

      
        var paras = $('#paras').val(),
            strength = $('input[name=strength]:checked').val();

        console.log(paras);
        console.log(strength);

        var input = {
          paragraph: paras,
          strength: strength
        };

        $.ajax({
          url: '/',
          type: 'get',
          data: input,
          dataType: 'json',
          success: function(response){
            console.log(response);


           string = response.toString();

           stringWithoutCommas = string.replace(/,(?!,)/g , " ");

           deutschesLorem = stringWithoutCommas.replace(/\.(?!\s)/g , "<br><br>");
           console.log(deutschesLorem);


            $( "#wrapperbottom" ).html( "<p id='result_header'>YOUR DEUTSCHES IPSUM IS READY FOR YOU</p><p> Deutsches Ipsum Dolor " + deutschesLorem + "</p>" );
           $(window).scrollTop(500);

          },
          error: function(response){
            console.log(response);
          }

        });

     

    });




});