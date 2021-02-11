*** Settings ***
Library  Selenium2Library
Library     BuiltIn
Library  OperatingSystem
Library     Collections
Library  String
Library  TestHelper.py


Suite Teardown   Suite shutdown

*** Variables ***

@{VehicleDetailsList}

*** Test Cases ***

Login And Get Vehilcle Specification Details
    Login to Outlook
    Check Email In Inbox
    Update The html

#Upload Files to Git
#    Open Browser    https://github.com/salmanaz31/htmlhosting  chrome
#    Maximize Browser Window
#    sleep   2s
#    Click Link   xpath=//a[@href="/salmanaz31/htmlhosting/tree/main/docs"]
#    sleep   5s
#
#    Click Link   xpath=//a[@href="/salmanaz31/htmlhosting/commit/696dae89ac992934b19f1f77595b8dc057b8f68c"]
    #Click Element   xpath=//*[@id="js-repo-pjax-container"]/div[3]/div/div[1]/div[3]/details/div/ul/li[4]


*** Keywords ***

Vehicle Specification Details Keyword
    Open Browser    https://outlook.live.com/owa/   chrome
    Maximize Browser Window
    Wait Until Page Contains    Outlook
    Element should Be Visible       xpath=/html/body/header/div/aside/div/nav/ul/li[2]/a

    Click Link    xpath=/html/body/header/div/aside/div/nav/ul/li[2]/a
    Wait Until Page Contains    Sign in
    Input Text  i0116   salma.naz@outlook.com
    Click Button    idSIButton9
    Wait Until Page Contains    Enter password
    Input Text      i0118   asger31far
    Click Button    idSIButton9
    Sleep   5s
    #Wait Until Page Contains    Stay signed in?
    #Click Button    idBtn_Back
    Wait Until Page Contains    New message
    Element should Be Visible       xpath=//*[@id="app"]/div/div[2]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div/div[1]/div[14]/div
    Click Element  xpath=//*[@id="app"]/div/div[2]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div/div[1]/div[14]/div
    Wait Until Page Contains    Steven
    Element should Be Visible   xpath=//*[@id="searchBoxId-Mail"]/div[3]/div/input
    Input Text  xpath=//*[@id="searchBoxId-Mail"]/div[3]/div/input     Honda
    Element should Be Visible   xpath=//*[@id="searchBoxColumnContainerId"]/div[1]/button/span/i
    Click Element    xpath=//*[@id="searchBoxColumnContainerId"]/div[1]/button/span/i
    Wait Until Page Contains    Honda
    Sleep   10s
    #Element should Be Visible       xpath=//*[@id="52f76a20-5c37-7994-b7c4-6ce1fb6d03ea"]/div/div/div/div[1]/div/div[1]/div/div
    #Click Element       xpath=//*[@id="52f76a20-5c37-7994-b7c4-6ce1fb6d03ea"]/div/div/div/div[1]/div/div[1]/div/div
    Element should be Visible       xpath=//*[contains(text(), "Honda")]
    Double Click Element    xpath=//*[contains(text(), "Honda")]
    #Mouse Down    xpath=//*[@class="_1hHMVrN7VV4d6Ylz-FsMuP _18LAllQi61d4a4XNAr9prg"]
    Sleep   5s
    Select Window   NEW
    ${window}=      Get Title
    #log to console     ${window}

    Maximize Browser Window
    Scroll Element Into View       xpath=//*[contains(text(), "Top Type:")]

    Sleep   5s

    # Get Odometer Value
    Element should be Visible       xpath=//*[contains(text(), "Odometer:")]
    ${valueodometer}=   Get Text    //*[@id="x_m_-7771708011284709406m_6055357149460991711retailSpecs"]/table/tbody/tr[2]/td
    log to console   \n\nOdometer: ${valueodometer}

    # Get Transmision Value
    Element should be Visible       xpath=//*[contains(text(), "Transmission:")]
    ${valuetransmission}=   Get Text    //*[@id="x_m_-7771708011284709406m_6055357149460991711retailSpecs"]/table/tbody/tr[3]/td
    log to console      Transmission: ${valuetransmission}

    # Get Exterior Color
    Element should be Visible       xpath=//*[contains(text(), "Exterior Color:")]
    ${valueEcolor}=   Get Text    //*[@id="x_m_-7771708011284709406m_6055357149460991711retailSpecs"]/table/tbody/tr[6]/td
    log to console      Exterior Color: ${valueEcolor}

    # Get Interior Color
    Element should be Visible       xpath=//*[contains(text(), "Interior Color:")]
    ${valueIcolor}=   Get Text    //*[@id="x_m_-7771708011284709406m_6055357149460991711retailSpecs"]/table/tbody/tr[7]/td
    log to console      Interior Color: ${valueIcolor}

    Close Browser

    Open Browser    file:///Users/salmawajeed/Desktop/EAB_DB_Ford.htm  chrome
    Maximize Browser Window
    Wait Until Page Contains    EXECUTIVE

    # update Odometer value
    Page Should Not Contain Element   Odometer
    Assign ID to Element    xpath=//*[@id="id1_1"]/table/tbody/tr[7]/td[2]/p    Odometer
    Page Should Contain Element    Odometer
    Execute Javascript    document.getElementById('Odometer').innerHTML = '${valueodometer}';


    # update Transmission value
    Page Should Not Contain Element   transmission
    Assign ID to Element    xpath=//*[@id="id1_1"]/table/tbody/tr[8]/td[2]/p    transmission
    Page Should Contain Element    transmission
    Execute Javascript    document.getElementById('transmission').innerHTML = '${valuetransmission}';

    # update Ecolor value
    Page Should Not Contain Element   ecolor
    Assign ID to Element    xpath=//*[@id="id1_1"]/table/tbody/tr[10]/td[2]/p    ecolor
    Page Should Contain Element    ecolor
    Execute Javascript    document.getElementById('ecolor').innerHTML = '${valueEcolor}';

    # update Icolor value
    Page Should Not Contain Element   icolor
    Assign ID to Element    xpath=//*[@id="id1_1"]/table/tbody/tr[12]/td[2]/p    icolor
    Page Should Contain Element    icolor
    Execute Javascript    document.getElementById('icolor').innerHTML = '${valueIcolor}';

    ${updatedodometer}=     Get text    Id=Odometer
    log to console   \n${updatedodometer}

    ${updatedtransmission}=     Get text    Id=transmission
    log to console   \n${updatedtransmission}

    ${updatedexteriorcolor}=     Get text    Id=ecolor
    log to console   \n${updatedexteriorcolor}

    ${updatedIcolor}=     Get text    Id=icolor
    log to console   \n${updatedIcolor}




    ${myHtml} =    Get Source
    Create File  ./updatedhtml.html     ${myHtml}

Login to Outlook

    Open Browser    https://outlook.live.com/owa/   chrome
    Maximize Browser Window
    Wait Until Page Contains    Outlook
    Element should Be Visible       xpath=/html/body/header/div/aside/div/nav/ul/li[2]/a
    Click Link    xpath=/html/body/header/div/aside/div/nav/ul/li[2]/a
    Wait Until Page Contains    Sign in
    Input Text  i0116   salu31.naz@outlook.com
    Click Button    idSIButton9
    Wait Until Page Contains    Enter password
    Input Text      i0118   Password@1234
    Click Button    idSIButton9
    Sleep   5s
    Wait Until Page Contains    New message
    Wait Until Element Is Visible    id__5   timeout=30

Check Email In Inbox

    ${c} =   Get Element Count   //*[@class="BVgxayg_IGpXi5g7S77GK"]/div
    Run Keyword If   ${c}>0    Select Email And Get Details
    ...     ELSE    log to console  The inbox email not there to select:${c}.

Select Email And Get Details

    log to console  email will be selected
    ${count} =   Get Element Count   //*[@class="BVgxayg_IGpXi5g7S77GK"]/div
    log to console  There are ${count} emails in Inbox:
    FOR  ${i}    IN RANGE    ${count}-1

      ${elId}=    get element attribute   xpath=//*[@class="BVgxayg_IGpXi5g7S77GK"]/div[${i}+1]   id
      log to console      the id is:${elId}
      ${len}=     get length  ${elId}
      run keyword if  ${len}>0     Click Email Element  ${elId}     ${i}
      ...     ELSE     log to console  there is no link

     END

Click Email Element
    [Arguments]  ${elId}    ${i}

        ${subjectText}=     Get Text    xpath=//*[@id="${elId}"]/div/div/div/div[2]/div[2]/div/span
        @{vehicleList}=    Create List  Porsche     Toyota      Mercedes    Honda

        ${status}=    Run Keyword And Return Status    List Should Contain Value    ${vehicleList}    ${subjectText}
        log to console      the status is:${status}
        Run Keyword If   ${status}==True    Click Email And Get Vehicle Specifications  ${i}
        ...     ELSE    log to console      This email is not vehicle specification email.

Click Email And Get Vehicle Specifications
    [Arguments]  ${i}
    ${i}=   set variable    ${i}+1

    Click Element   xpath=//*[@class="BVgxayg_IGpXi5g7S77GK"]/div[${i}]
    sleep   2s

    ${c}=   Get Element Count   xpath=//*[@class="_2Ypz6DjF0cnPXsnj_7roel"]/table/tbody/tr/td/div[3]/div/table/tbody/tr/td[2]/div/table/tbody/tr

    log to console  the specification count is:${c}

    ${SpecificationDict}=      Create Dictionary

    FOR    ${i}    IN RANGE    ${c}-1

    ${i}=   set variable    ${i}+1

    log to console  the specification index is:${i}
    ${key}=     Get Text    //*[@class="_2Ypz6DjF0cnPXsnj_7roel"]/table/tbody/tr/td/div[3]/div/table/tbody/tr/td[2]/div/table/tbody/tr[${i}]/th
    ${value}=   Get Text     //*[@class="_2Ypz6DjF0cnPXsnj_7roel"]/table/tbody/tr/td/div[3]/div/table/tbody/tr/td[2]/div/table/tbody/tr[${i}]/td

    Set To Dictionary    ${SpecificationDict}    ${key}      ${value}

    END

    ${htmlString}=   set variable      <table class="list-table full-width"><thead><tr><th>Specification</th><th>Value</th></tr></thead><tbody>


    FOR  ${key}  IN   @{SpecificationDict.keys()}

    ${value}=   set variable    ${SpecificationDict["${key}"]}
    ${htmlString}=  catenate  ${htmlString}     <tr class="righttd"><td>${key}</td><td class="right"><span>${value}</span></td></tr>

    END

    ${htmlString}=  catenate  ${htmlString}     </tbody></table>

    ${vehicleyear}=     get text    xpath=//*[@class="_2Ypz6DjF0cnPXsnj_7roel"]/table/tbody/tr/td/h3
    @{year}=    split string    ${vehicleyear}

    ${caryear}=     set variable    ${year}[0]
    ${modelnewlist}=   Remove from list    ${year}    0

    ${carmodel}=    Catenate   @{year}

    ${price}=   Get Text    xpath=//*[@class="_2Ypz6DjF0cnPXsnj_7roel"]/table/tbody/tr/td/div[2]/table/tbody/tr/td/table/tbody/tr[7]/td
    @{pricelist}=    split string    ${price}
    ${carprice}=     set variable    ${pricelist}[0]


   ${odometer}=    set variable    Odometer:${SpecificationDict["Odometer:"]}


    ${VIN}=     Evaluate    ${SpecificationDict}.get("VIN:")
    ${VIN}=     Get Substring   ${VIN}   -4


    ${mainimage}=   get element attribute   xpath=//*[@class="_2Ypz6DjF0cnPXsnj_7roel"]/table/tbody/tr/td/div[3]/div/table/tbody/tr/td/img  src


    ${smallimagecounttr}=  Get Element Count   xpath=//*[@class="_2Ypz6DjF0cnPXsnj_7roel"]/table/tbody/tr/td/div[4]/div/table/tbody/tr


    @{smallImagelist}=  create list

    FOR    ${index}    IN RANGE    ${smallimagecounttr}

        ${index}=   set variable  ${index}+1
        log to console      the smalltr is:${index}
        ${smallimagecounttd}=    Get Element Count   xpath=//*[@class="_2Ypz6DjF0cnPXsnj_7roel"]/table/tbody/tr/td/div[4]/div/table/tbody/tr[${index}]/td
        log to console  the smallimagecounttd is:${smallimagecounttd}
        Get Image source  ${index}  ${smallimagecounttd}    ${smallImagelist}
    END


    ${equipmentincludetr}=  Get Element Count   xpath=//*[@class="_2Ypz6DjF0cnPXsnj_7roel"]/table/tbody/tr/td/div[3]/div[2]/table/tbody/tr

    @{equipmentincludelist}=  create list

    FOR    ${index}    IN RANGE    ${equipmentincludetr}

        ${index}=   set variable  ${index}+1
        ${equipmentincludetd}=    Get Element Count   xpath=//*[@class="_2Ypz6DjF0cnPXsnj_7roel"]/table/tbody/tr/td/div[3]/div[2]/table/tbody/tr[${index}]/td

        Get Equipment source    ${index}  ${equipmentincludetd}    ${equipmentincludelist}
    END


    &{subjectText}=      create dictionary  year=${caryear}   headerodometer=${odometer}    carmodel=${carmodel}   html=${htmlString}   imagemain=${mainimage}  price=${carprice}   VIN=${VIN}

    Add Image url to Dic    ${smallImagelist}   ${subjectText}
    Add Equipment data to Dic   ${equipmentincludelist}     ${subjectText}

    Append to list     ${VehicleDetailsList}        ${subjectText}

Update The html

    ${listlength}=  get length  ${VehicleDetailsList}
    log to console  the list length is: ${listlength}

    FOR    ${i}    IN RANGE   ${listlength}
    log to console  the vehicle is:${i}

    Open Browser    file:///${CURDIR}/index.html    chrome
    Maximize Browser Window
    Wait Until Page Contains   Vehicle Quote Sheet

    ${year}=   set variable    ${VehicleDetailsList[${i}]["year"]}
    ${odometer}=   set variable    ${VehicleDetailsList[${i}]["headerodometer"]}
    ${model}=   set variable    ${VehicleDetailsList[${i}]["carmodel"]}
    ${htmlvalue}=   set variable    ${VehicleDetailsList[${i}]["html"]}
    ${imagemain}=  set variable  ${VehicleDetailsList[${i}]["imagemain"]}
    ${smallimages}=  set variable  ${VehicleDetailsList[${i}]["smallimages"]}
    ${price}=   set variable    ${VehicleDetailsList[${i}]["price"]}
    ${equiplist}=   set variable  ${VehicleDetailsList[${i}]["equipdetails"]}
    ${VIN}=   set variable  ${VehicleDetailsList[${i}]["VIN"]}

    Execute Javascript  document.getElementById('odoReading').innerHTML = '${odometer}';
    Execute Javascript  document.getElementById('makeModel').innerHTML = '${model}';
    Execute Javascript  document.getElementById('makeYear').innerHTML = '${year}';
    Execute Javascript  document.getElementById('bigImage').setAttribute("src", "${imagemain}");


    Execute Javascript  document.getElementById('pricingQuote').innerHTML = '${price}';

    Page Should Not Contain Element   smallimages
    Assign ID to Element    xpath=/html/body/div/div/div[2]/div/div[2]  smallimages

    Page Should Contain Element    smallimages
    Execute Javascript    document.getElementById('smallimages').innerHTML = '${smallimages}';
    Execute Javascript  document.getElementById('vehicleSpecs').innerHTML = '${htmlvalue}';
    Execute Javascript  document.getElementById('vehicleEquips').innerHTML = '${equiplist}';
    Execute Javascript  document.getElementById('smallimages').setAttribute("class", "photos-col-5");


    ${myHtml} =    Get Source
    Create File  ./executiveAB.com 3/${VIN}_${model}.html     ${myHtml}

    END

Get Image source
    [Arguments]     ${index}    ${smallimagecounttd}    ${smallImagelist}


    FOR    ${i}    IN RANGE    ${smallimagecounttd}
        ${i}=   set variable  ${i}+1
        ${smallimagepath}=  get element attribute   xpath=//*[@class="_2Ypz6DjF0cnPXsnj_7roel"]/table/tbody/tr/td/div[4]/div/table/tbody/tr[${index}]/td[${i}]/img   src
        Append to list      ${smallImagelist}       ${smallimagepath}

     END

Add Image url to Dic
    [Arguments]  ${smallImagelist}      ${subjectText}

    ${imageslen}=   get length  ${smallImagelist}
    ${smallImages}=     set variable  ${empty}
    FOR  ${i}    IN RANGE   ${imageslen}

    ${smallImagesbase}=     set variable    <img id="smallImg_${i}+1" class="block-auto" src="${smallImagelist}[${i}]" alt="">
    ${smallImages}=     catenate  ${smallImages}    ${smallImagesbase}

    END

    set to dictionary       ${subjectText}      smallimages    ${smallImages}

Get Equipment source
    [Arguments]     ${index}    ${equipmentincludetd}     ${equipmentincludelist}


    FOR    ${i}    IN RANGE    ${equipmentincludetd}
        ${i}=   set variable  ${i}+1
        ${smallimagepath}=  get Text   xpath=//*[@class="_2Ypz6DjF0cnPXsnj_7roel"]/table/tbody/tr/td/div[3]/div[2]/table/tbody/tr[${index}]/td[${i}]

        Append to list      ${equipmentincludelist}       ${smallimagepath}

     END

Add Equipment data to Dic
    [Arguments]  ${equipmentincludelist}      ${subjectText}

    ${equiplist}=   get length  ${equipmentincludelist}

    ${equipdetailtable}=     run keyword if  ${equiplist}>0    set variable  <table class="list-table full-width"><tbody><tr><td>${equipmentincludelist}[0]</td>
    ...     ELSE    log to console  The equipment list do not have any data to display.

    ${equip}=   set variable  ${empty}
    FOR  ${i}    IN RANGE   ${equiplist}-1
    ${i}=   evaluate    ${i}+1


    ${tr1}=    run keyword if     ${i}%3==0       set variable  </tr><tr><td>${equipmentincludelist}[${i}]</td>
    ...     ELSE   set variable  <td>${equipmentincludelist}[${i}]</td>

    ${equip}=   catenate    ${equip}     ${tr1}
    ${equip}=    replace string   ${equip}    </td>${space}   </td>

    END

    ${equip}=   remove_special_chars    ${equip}
    ${equip}=   catenate  ${equipdetailtable}   ${equip}</tr></tbody></table>

    set to dictionary       ${subjectText}      equipdetails    ${equip}

Suite shutdown
    Close All Browsers






