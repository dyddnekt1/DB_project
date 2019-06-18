<?php
include "config.php";    //데이터베이스 연결 설정파일
include "util.php";      //유틸 함수

$conn = dbconnect($host,$dbid,$dbpass,$dbname);

// 추가됨
mysqli_query($conn, "set autocommit = 0");
mysqli_query($conn, "set transation isolation level serializable");
mysqli_query($conn, "begin");

$episode_id = $_GET['episode_id'];
$comment = $_POST['comment'];

$ret = mysqli_query($conn, "INSERT INTO review VALUE (NULL, '$episode_id', '$comment');");
if(!$ret)
{
	mysqli_query($conn, "rollback"); // 추가됨
	echo mysqli_error($conn);
    msg('Query Error : '.mysqli_error($conn));
}
else
{
	mysqli_query($conn, "commit"); // 추가됨
    s_msg ('성공적으로 입력 되었습니다.');
    echo "<meta http-equiv='refresh' content='0;url=review_list.php?episode_id=$episode_id'>";
}

?>

