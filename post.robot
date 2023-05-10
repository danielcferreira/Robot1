*** Settings ***
Documentation    Post /partners

Library        RequestsLibrary
Library        RobotMongoDBLibrary.Delete

*** Variables ***
${BASE_URL}         http://localhost:3333/partners
&{MONGO_URI}        connection=mongodb+srv://daniel:daniel12@cluster0.ow3993q.mongodb.net/?retryWrites=true&w=majority    database=test   collection=partner



*** Test Cases ***
should create a new partner
   Create Session    alias=Buger      url=${BASE_URL}
  
   ${headers}        Create Dictionary      
   ...    Content-Type=application/json    
   ...    auth_user=qa    
   ...    auth_password=ninja
   
   ${filter}    Create Dictionary    
   ...          name=casadoarnaldo2  

   DeleteOne    ${MONGO_URI}    ${filter}

   ${response}        POST On Session       
   ...    alias=Buger    
   ...    url=${BASE_URL}    
   ...    expected_status=201   
   ...    headers=${headers}    
   ...    data={"name":"casadoarnaldo2","email":"arnaldo0@co2ntatoarna.com.br","whatsapp":"51923664813","business":"Restaurante"} 

   Status Should Be    201 
   Log To Console    ${response} 