//%attributes = {}
$es適格請求書発行事業者:=ds:C1482.適格請求書発行事業者.all()

$data:=$es適格請求書発行事業者.slice(0; 1000).data

$asc:=$data.orderBy("addressPrefectureCode asc")
