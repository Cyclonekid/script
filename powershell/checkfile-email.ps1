function sendmail()
{
    function mailoptions($mailaddr,$body) #���巢���ʼ��ķ���
    {  
        $msg=New-Object System.Net.Mail.MailMessage  
        $msg.To.Add($mailaddr)  
        $msg.From = New-Object System.Net.Mail.MailAddress("notice@test.com", "���ݵ��Ա",[system.Text.Encoding]::GetEncoding("UTF-8"))   #������
        $msg.Subject = "Windows����ʧ��֪ͨ��"  
        $msg.SubjectEncoding = [system.Text.Encoding]::GetEncoding("UTF-8")  
        $msg.Body =$body    
        $msg.BodyEncoding = [system.Text.Encoding]::GetEncoding("UTF-8")  
        $msg.IsBodyHtml = $false #����html��ʽ�ʼ�
        $client = New-Object System.Net.Mail.SmtpClient("smtp.qiye.163.com")  #����smtp������
        $client.Port = 25 #ָ��smtp�˿�
        $client.UseDefaultCredentials = $false  
        $client.Credentials=New-Object System.Net.NetworkCredential("notice@test.com", "xxxxxxxx")  
        try {$client.Send($msg)}  
            catch [Exception]
            {$($_.Exception.Message)  
            $mailaddr  
            }
    }

    $tomailaddr = "ops@test.com"
    mailoptions $tomailaddr $Emailbody
}



$Emailbody= "Dear All :
"

$counter= 0

#test���ݼ��
if (Get-ChildItem D:\serverbackup\WindowsImageBackup\test\Catalog | Where{$_.LastWriteTime -lt (Get-Date).AddDays(-32)})
{
    $Emailbody= $Emailbody +
    "
    �� test��10.8.8.1����
    "
    $counter= $counter + 1
}

$Emailbody= $Emailbody +
"
    �澯��Դ 127.0.0.1
"

if ($counter -gt 0)
{
    sendmail
}
