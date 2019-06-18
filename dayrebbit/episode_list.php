<?
include "header.php";
include "config.php";    //데이터베이스 연결 설정파일
include "util.php";      //유틸 함수
?>
<div class="container">
    <?
    echo "<a href='webtoon_list.php'><button class='button primary small'>목록</button></a>";
    $conn = dbconnect($host, $dbid, $dbpass, $dbname);
    $webtoon_id = $_GET[webtoon_id];
    $query = "SELECT * FROM episode WHERE webtoon_id = $webtoon_id";

    $res = mysqli_query($conn, $query);
    if (!$res) {
         die('Query Error : ' . mysqli_error());
    }
    ?>

    <table class="table table-striped table-bordered">
        <thead>
        </thead>
        <tbody>
        <?
        $row_index = 1;
        while ($row = mysqli_fetch_array($res)) {
            echo "<tr>";
            echo "<td><a href='{$row['link']}'>{$row['episode_title']}</a></td>";
            echo "<td width='85'><a href='review_list.php?episode_id={$row['episode_id']}'><button class='button primary small'>댓글창</button></a></td>";
            echo "</tr>";
            $row_index++;
        }
        ?>
        </tbody>
    </table>
</div>
<? include("footer.php") ?>
