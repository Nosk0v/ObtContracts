// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Note {
    string public lastContactName;
    uint public lastContactNumber;
    string public lastContactAddress;

    function set(string memory newName, uint newNumber, string memory newAddress) public {
        lastContactName = newName;
        lastContactNumber = newNumber;
        lastContactAddress = newAddress;
    }

    function getLastContact() public view returns (string memory, uint, string memory) {
        return (lastContactName, lastContactNumber, lastContactAddress);
    }
}
