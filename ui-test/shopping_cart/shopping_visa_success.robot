*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers
*** Variables ***
${URL}    https://dminer.in.th/Product-list.html

*** Test Cases ***
user want to buy a toy for the kids with kerry packing and use visa-card for the payment
    แสดงสินค้า
    แสดงรายละเอียดสินค้า
    ระบุจำนวนสินค้าที่จะซื้อ
    นำสินค้าใส่ตระกร้า
    ยืนยันการสั่งซื้อและชำระเงิน
    ชำระเงินด้วยบัตร credit-visa card

*** Keywords ***
แสดงสินค้า
    Open Browser    ${URL}    chrome
    Element Should Contain    id=productName-1    expected=43 Piece Dinner Set
    Element Should Contain    id=productPrice-1    expected=12.95 USD
แสดงรายละเอียดสินค้า
    Click Element    id=viewMore-1
ระบุจำนวนสินค้าที่จะซื้อ
    Wait Until Page Contains Element    id:productQuantity
    Click Element    id=productQuantity
    Press Keys    None    1
    Click Element    id=addToCart
นำสินค้าใส่ตระกร้า
    Wait Until Page Contains Element    id:productName-1
    Element Should Contain    id=productName-1    expected=43 Piece dinner Set
    Element Should Contain    id=totalProductPrice    expected=12.95 USD
    Element Should Contain    id=totalShippingCharge    expected=2.00 USD
    Element Should Contain    id=totalAmount    expected=14.95 USD
    Element Should Contain    id=recevierAddress    expected=405/37 ถ.มหิดล ต.ท่าศาลา อ.เมือง จ.เชียงใหม่ 50000
    Click Element    id:confirmPayment
ยืนยันการสั่งซื้อและชำระเงิน
    Wait Until Page Contains Element    id:cardNumber
    Press Keys    id:cardNumber    4719700591590995
    Press Keys    id:cvv    752
    Press Keys    id:expiredMonth    7
    Press Keys    id:expiredYear    20
    Press Keys    id:cardName    Karnwat Wongudom
    Click Element    id:Payment

ชำระเงินด้วยบัตร credit-visa card
    Wait Until Page Contains Element    id:goHome
    Click Element    id:goHome
