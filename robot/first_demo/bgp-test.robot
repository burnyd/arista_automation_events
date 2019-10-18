*** Settings ***
Documentation     This test changes a BGP neighbor statement to the wrong AS to verify that the neighbor state becomes un-established.
...               The test reverts the neighbor statement to it's proper state.
Suite Setup       Connect To Switches
Suite Teardown    Clear All Connections
Library           AristaLibrary
Library           AristaLibrary.Expect
Library           Collections

*** Variables ***
# Neighbor peer address
${PEER_ADDRESS}    10.1.102.1
${PEER_ADDRESS_2}    10.2.102.1

# Neighbor remote-as

*** Test Cases ***
PEER Established
    [Documentation]    Check PEER Established
    Get Command Output    cmd=show ip bgp summary
    Expect    vrfs default peers ${PEER_ADDRESS} peerState    is    Established

PEER Established
    [Documentation]    Check PEER Established
    Expect    vrfs default peers ${PEER_ADDRESS} peerState    is    Established


Gather Post Change Output
    Record Output    cmd=show ip bgp summary

*** Keywords ***
Connect To Switches
    [Documentation]    Establish connection to a switch which gets used by test cases.
    Connect To    host=${SW1_HOST}    transport=${TRANSPORT}    username=${USERNAME}    password=${PASSWORD}
