*** Settings ***
Library    RequestsLibrary
Suite Setup    Create Session    alias=shopping    url=https://dminer.in.th
*** Variables ***
&{headers}    Content-Type=application/json    Accept=application/json

*** Test Cases ***
user want to buy a toy for the kids with kerry packing and use visa-card for the payment
    Search
    Product Detail
    Submit Order
    Confirm Payment

*** Keywords ***
Search
    ${resp}=    Get Request    alias=shopping    uri=/api/v1/product
    Request Should Be Successful    ${resp}
    Should Be Equal    ${resp.json()['products'][1]['product_name']}    43 Piece dinner Set
    Should Be Equal As Numbers    ${resp.json()['products'][1]['product_price']}    12.95
    Should Be Equal    ${resp.json()['products'][1]['product_image']}    /43_Piece_dinner_Set.png

Product Detail
    ${resp}=    Get Request    alias=shopping    uri=/api/v1/product/2    headers=&{headers}
    Request Should Be Successful    ${resp}
    ${product_name}    Set Variable    ${resp.json()['product_name']}
    ${product_price}    Set Variable    ${resp.json()['product_price']}
    ${quantity}    Set Variable    ${resp.json()['quantity']}
    Should Be Equal    ${product_name}    43 Piece dinner Set
    Should Be Equal As Numbers    ${product_price}    12.95
    Should Be Equal As Integers  ${quantity}    10

Submit Order
    ${data}=    To Json    { "cart" : [ {"product_id": 2, "quantity": 1 }], "shipping_method" : "Kerry", "shipping_address" : "405/37 ถ.มหิดล", "shipping_sub_district" : "ต.ท่าศาลา", "shipping_district" : "อ.เมือง", "shipping_province" : "จ.เชียงใหม่", "shipping_zip_code" : "50000", "recipient_name" : "ณัฐญา ชุติบุตร", "recipient_phone_number" : "0970809292"}
    ${resp}=    Post Request    alias=shopping    uri=/api/v1/order    headers=&{headers}    json=${data}
    Request Should Be Successful    ${resp}
    ${order_id}    Set Variable    ${resp.json()['order_id']}
    ${total_price}    Set Variable    ${resp.json()['total_price']}
    ${status_code}    Set Variable    ${resp.status_code}
    Should Be Equal As Integers    ${order_id}    8004359122
    Should Be Equal As Numbers    ${total_price}    14.95
    Should Be Equal As Integers    ${status_code}    200

Confirm Payment
    ${data}=    To Json    {"order_id" : 8004359122,"payment_type" : "credit","type" : "visa","card_number" : "4719700591590995","cvv" : "752","expired_month" : 7,"expired_year" : 20,"card_name" : "Karnwat Wongudom","total_price" : 14.95}
    ${resp}=    Post Request    alias=shopping    uri=/api/v1/confirmPayment    headers=&{headers}    json=${data}
    ${notify_message}    Set Variable    ${resp.json()['notify_message']}
    ${status_code}    Set Variable    ${resp.status_code}
    Should Be Equal    ${notify_message}    วันเวลาที่ชำระเงิน 1/3/2020 13:30:00 หมายเลขคำสั่งซื้อ 8004359122 คุณสามารถติดตามสินค้าผ่านช่องทาง Kerry หมายเลข 1785261900
    Should Be Equal As Integers    ${status_code}    200