//%attributes = {"invisible":true}
If (Storage:C1525.適格請求書発行事業者=Null:C1517)
	
	var $data : Collection
	$data:=New collection:C1472
	
	$files:=Folder:C1567(fk resources folder:K87:11).files().query("extension == :1"; ".json")
	
	For each ($file; $files)
		$data.combine(JSON Parse:C1218($file.getText(); Is collection:K8:32))
	End for each 
	
	Use (Storage:C1525)
		Storage:C1525.適格請求書発行事業者:=$data.copy(ck shared:K85:29)
	End use 
	
End if 

TRUNCATE TABLE:C1051([適格請求書発行事業者:1])
SET DATABASE PARAMETER:C642([適格請求書発行事業者:1]; Table sequence number:K37:31; 0)

For each ($data; Storage:C1525.適格請求書発行事業者.copy())
	
	$e:=ds:C1482.適格請求書発行事業者.new()
	$e.data:=$data
	$e.save()
	
End for each 