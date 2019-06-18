<?
include "header.php";
include "config.php";    //데이터베이스 연결 설정파일
include "util.php";      //유틸 함수
?>
<div class="container">
    <?
    $conn = dbconnect($host, $dbid, $dbpass, $dbname);
    $query = "SELECT * FROM webtoon NATURAL JOIN cartoonist NATURAL JOIN platform";
    if (array_key_exists("search_keyword", $_POST)) {  // array_key_exists() : Checks if the specified key exists in the array
        $search_keyword = $_POST["search_keyword"];
        $query =  $query . " WHERE webtoon_title LIKE '%$search_keyword%' OR cartoonist_name LIKE '%$search_keyword%'";
    }
    $res = mysqli_query($conn, $query);
    if (!$res) {
         die('Query Error : ' . mysqli_error());
    }
    ?>

    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>제목</th>
            <th>작가</th>
            <th>연재처</th>
        </tr>
        </thead>
        <tbody>
        <?
        $row_index = 1;
        while ($row = mysqli_fetch_array($res)) {
            echo "<tr>";
            echo "<td><a href='episode_list.php?webtoon_id={$row['webtoon_id']}'>{$row['webtoon_title']}</a></td>";
            echo "<td>{$row['cartoonist_name']}</td>";
            echo "<td>{$row['platform_name']}</td>";
            echo "</tr>";
            $row_index++;
        }
        ?>
        </tbody>
    </table>
</div>
<? include("footer.php") ?>
