<?
include "header.php";
include "config.php";    //데이터베이스 연결 설정파일
include "util.php";      //유틸 함수
?>
<div class="container">
    <?
    echo "<a href='webtoon_list.php'><button class='button primary small'>목록</button></a>";
    $conn = dbconnect($host, $dbid, $dbpass, $dbname);
    $episode_id = $_GET[episode_id];
    $query = "SELECT * FROM review WHERE episode_id = $episode_id";

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
            echo "<td>{$row['comment']}</td>";
            echo "<td width='145'>
            <a href='review_form.php?episode_id={$episode_id}&review_id={$row['review_id']}'><button class='button primary small'>수정</button></a>
            <button onclick = 'javascript:deleteConfirm({$row['review_id']}, {$row['episode_id']})' class='button danger small'>삭제</button></td>";
            echo "</tr>";
            $row_index++;
        }
        ?>
        </tbody>
    </table>
    <? echo "<a href='review_form.php?episode_id={$episode_id}'><button class='button primary small'>댓글 쓰기</button></a>"; ?>

    <script>
    	function deleteConfirm(review_id, episode_id){
    		if(confirm("정말 삭제하시겠습니까?") == true)
    		{ window.location = "review_delete.php?review_id=" + review_id + "&episode_id=" + episode_id;}
    		else { return;}
    	}
    </script>
</div>
<? include("footer.php") ?>
