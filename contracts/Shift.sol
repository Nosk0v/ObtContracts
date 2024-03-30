// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Shift {
    function ShiftLeftRight(uint8 a, uint8 shift, bytes32 operation) public pure returns (uint8) {
        
        
     
        
        
        if (operation == "<") {
           
            return a << shift;
        } else if (operation == ">") {
            
            return a >> shift;
        }
        revert("Invalid operation");
         
    }

    
}