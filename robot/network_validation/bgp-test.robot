*** Settings ***
Documentation     This test changes a BGP neighbor statement to the wrong AS to verify that the neighbor state becomes un-established.
...               The test reverts the neighbor statement to it's proper state.
Suite Setup       Connect To Switches
Suite Teardown    Clear All Connections
Library           AristaLibrary
Library           AristaLibrary.Expect
Library           Collections
Library    network_validation.Bgp


*** Test Cases ***
show bgp neighbors
   Record Output    cmd=show ip bgp summary

*** Keywords ***
Connect To Switches
    [Documentation]    Establish connection to a switch which gets used by test cases.


    Connect To    host=${ SW1_HOST }    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
    Get Command Output  cmd=show ip bgp summary
    Record Output
    ${peers}=       Get Value    vrfs default peers
    :FOR    ${peer}  IN      @{peers}
    \       Log     ${peer}
    \       Expect  vrfs default peers ${peer} peerState  to be  Established


    Connect To    host=${ SW2_HOST }    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
    Get Command Output  cmd=show ip bgp summary
    Record Output
    ${peers}=       Get Value    vrfs default peers
    :FOR    ${peer}  IN      @{peers}
    \       Log     ${peer}
    \       Expect  vrfs default peers ${peer} peerState  to be  Established


    Connect To    host=${ SW3_HOST }    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
    Get Command Output  cmd=show ip bgp summary
    Record Output
    ${peers}=       Get Value    vrfs default peers
    :FOR    ${peer}  IN      @{peers}
    \       Log     ${peer}
    \       Expect  vrfs default peers ${peer} peerState  to be  Established


    Connect To    host=${ SW4_HOST }    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
    Get Command Output  cmd=show ip bgp summary
    Record Output
    ${peers}=       Get Value    vrfs default peers
    :FOR    ${peer}  IN      @{peers}
    \       Log     ${peer}
    \       Expect  vrfs default peers ${peer} peerState  to be  Established


    Connect To    host=${ SW5_HOST }    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
    Get Command Output  cmd=show ip bgp summary
    Record Output
    ${peers}=       Get Value    vrfs default peers
    :FOR    ${peer}  IN      @{peers}
    \       Log     ${peer}
    \       Expect  vrfs default peers ${peer} peerState  to be  Established


    Connect To    host=${ SW6_HOST }    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
    Get Command Output  cmd=show ip bgp summary
    Record Output
    ${peers}=       Get Value    vrfs default peers
    :FOR    ${peer}  IN      @{peers}
    \       Log     ${peer}
    \       Expect  vrfs default peers ${peer} peerState  to be  Established


    Connect To    host=${ SW7_HOST }    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
    Get Command Output  cmd=show ip bgp summary
    Record Output
    ${peers}=       Get Value    vrfs default peers
    :FOR    ${peer}  IN      @{peers}
    \       Log     ${peer}
    \       Expect  vrfs default peers ${peer} peerState  to be  Established


    Connect To    host=${ SW8_HOST }    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
    Get Command Output  cmd=show ip bgp summary
    Record Output
    ${peers}=       Get Value    vrfs default peers
    :FOR    ${peer}  IN      @{peers}
    \       Log     ${peer}
    \       Expect  vrfs default peers ${peer} peerState  to be  Established


    Connect To    host=${ SW9_HOST }    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
    Get Command Output  cmd=show ip bgp summary
    Record Output
    ${peers}=       Get Value    vrfs default peers
    :FOR    ${peer}  IN      @{peers}
    \       Log     ${peer}
    \       Expect  vrfs default peers ${peer} peerState  to be  Established


    Connect To    host=${ SW10_HOST }    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
    Get Command Output  cmd=show ip bgp summary
    Record Output
    ${peers}=       Get Value    vrfs default peers
    :FOR    ${peer}  IN      @{peers}
    \       Log     ${peer}
    \       Expect  vrfs default peers ${peer} peerState  to be  Established


    Connect To    host=${ SW11_HOST }    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
    Get Command Output  cmd=show ip bgp summary
    Record Output
    ${peers}=       Get Value    vrfs default peers
    :FOR    ${peer}  IN      @{peers}
    \       Log     ${peer}
    \       Expect  vrfs default peers ${peer} peerState  to be  Established


    Connect To    host=${ SW12_HOST }    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
    Get Command Output  cmd=show ip bgp summary
    Record Output
    ${peers}=       Get Value    vrfs default peers
    :FOR    ${peer}  IN      @{peers}
    \       Log     ${peer}
    \       Expect  vrfs default peers ${peer} peerState  to be  Established


    Connect To    host=${ SW13_HOST }    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
    Get Command Output  cmd=show ip bgp summary
    Record Output
    ${peers}=       Get Value    vrfs default peers
    :FOR    ${peer}  IN      @{peers}
    \       Log     ${peer}
    \       Expect  vrfs default peers ${peer} peerState  to be  Established


Gather Post Change Output
    Record Output    cmd=show ip bgp summary
