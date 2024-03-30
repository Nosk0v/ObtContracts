// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Date {
    function getDateDifference(uint timestamp1, uint timestamp2) public pure returns (uint) {
        require(timestamp1 <= timestamp2, "Invalid timestamps");
        return timestamp2 - timestamp1;
    }

    function DaysToDate(uint timestamp, uint daysTo, bytes32 operation) public pure returns (uint) {
        if (operation == "+") {
            return timestamp + (daysTo * 1 days);
        } else if(operation == "-") {
             return timestamp - (daysTo * 1 days);
        }
        revert("Invalid operation");
        
    }

    
}