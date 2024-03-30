// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Perr16 {
    function BinaryToDecimalSix(uint16 decimalNumber) public pure returns(string memory) {
        require(decimalNumber >= 0 && decimalNumber <= 65535);
        string memory hexString = toHexString(decimalNumber);
        return hexString;
    }

    function toHexString(uint16 decimalNumber) internal pure returns (string memory) {
        bytes memory buffer = new bytes(4);
        uint256 mask = 15;

        bool foundSignificantDigit = false; // Флаг для определения, были ли найдены значимые цифры

        for (uint256 i = 0; i < 4; i++) {
            uint256 digit = decimalNumber & mask;
            if (foundSignificantDigit || digit != 0) {
                buffer[3 - i] = toHexChar(digit);
                foundSignificantDigit = true;
            }
            decimalNumber >>= 4;
        }
        
        // Если не было найдено значимых цифр, возвращаем "0"
        if (!foundSignificantDigit) {
            return "0";
        }

        return string(buffer);
    }

    function toHexChar(uint256 digit) internal pure returns (bytes1) {
        if (digit < 10) {
            return bytes1(uint8(digit) + 48);
        } else {
            return bytes1(uint8(digit - 10 + 65));
        }
    }
}
