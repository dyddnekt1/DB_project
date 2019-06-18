<?
include "header.php";
include "config.php";    //데이터베이스 연결 설정파일
include "util.php";      //유틸 함수

$conn = dbconnect($host, $dbid, $dbpass, $dbname);
$mode = "입력";
$action = "review_insert.php";

if (array_key_exists("review_id", $_GET)) {
    $review_id = $_GET["review_id"];
    $query =  "SELECT * FROM review WHERE review_id = $review_id";
    $res = mysqli_query($conn, $query);
    $review = mysqli_fetch_array($res);
    if(!$review) {
        msg("잘못된 접근입니다.");
    }
    $mode = "수정";
    $action = "review_modify.php";
}

$episode_id = $_GET['episode_id'];
$action = $action . "?episode_id={$episode_id}";

?>
    <div class="container">
        <form name="review_form" action="<?=$action?>" method="post" class="fullwidth">
            <input type="hidden" name="review_id" value="<?=$review['review_id']?>"/>
            <h3>댓글 <?=$mode?></h3>
            <p>
                <label for="comment">댓글</label>
                <textarea placeholder="내용 입력" id="comment" name="comment" rows="10"><?=$review['comment']?></textarea>
            </p>

            <p align="center"><button class="button primary small" onclick="javascript:return validate();"><?=$mode?></button>
			<? echo "<a href='review_list.php?episode_id={$episode_id}'><button type='button' class='button danger small'>취소</button></a>"; ?>
			</p>
            <script>
                function validate() {
                    if(document.getElementById("comment").value == "") {
                        alert ("내용을 입력해 주십시오"); return false;
                    }
                    return true;
                }
            </script>
        </form>
    </div>
<? include("footer.php") ?>