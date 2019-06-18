<?php include ("header.php"); ?>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://rochestb.github.io/jQuery.YoutubeBackground/src/jquery.youtubebackground.js"></script>
    <div id="video" class="background-video"></div>
    <script>
        $('#video').YTPlayer({
            fitToBackground: true,
            videoId: 'ZbofJucjkSU'
        });
    </script>
    <style>
        .background-video {
            background-position: top center;
            background-repeat: no-repeat;
            bottom: 0;
            left: 0;
            overflow: hidden;
            position: fixed;
            right: 0;
            top: 0;
        }
        .navbar {
            z-index:999;
        }
        h1, p {
            padding: 0px 30px 0px 30px;
            text-align:center;
        }
        h1 {
            font-weight:800;
        }
        .container {
            position: relative;
            background: rgba(255, 255, 255, .9);
        }
        .ref {
            font-weight:200;
            font-size:0.5em;
        }
    </style>
    <div class='container'>
        <p align="center"><img src="images/dayrebbit.jpg" width="100%"></p>
        <p>낮토끼에서 웹툰을 즐기세요!</p>
    </div>
<?php include ("footer.php"); ?>