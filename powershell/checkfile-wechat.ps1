function wechattalk()
{
  curl -Method Get "https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=xxxxxx"
}

$msg= "Windows Server����ʧ��֪ͨ��
"
$counter= 0

#���ݼ��
if (Get-ChildItem D:\serverbackup\WindowsImageBackup\test\Catalog | Where{$_.LastWriteTime -lt (Get-Date).AddDays(-32)})
{
    $msg= $msg +
    "
    �� test��10.8.8.1����
    "
    $counter= $counter + 1
}

if ($counter -eq 0){
    $msg= "Windows Server ���ݼ����ɣ�����״̬������"
}

$msg= $msg +
"
    �澯��Դ 127.0.0.1
"

wechattalk