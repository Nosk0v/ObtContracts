// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Polit2 {
    function NandNorXor(uint8 a, uint8 b, bytes32 operation) public pure returns (uint8) {
        if (operation == "NAND") {
            return uint8(~(a & b));
        } else if (operation == "NOR") {
            return uint8(~(a | b));
        } else if (operation == "XOR") {
            return a ^ b;
        }
        revert("Invalid operation");
    }
}