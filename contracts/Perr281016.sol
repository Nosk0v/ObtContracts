// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Perr281016 {
    function convertNumber(string memory number, uint8 fromBase, uint8 toBase) public pure returns(string memory) {
      require(fromBase >=2 && fromBase<=16);
      require(toBase >=2 && toBase<=16);

      uint256 decimalNumber = fromBaseConversionToDecimal(number, fromBase);
      return toBaseConversionToDecimal(decimalNumber, toBase);

    
      
     
    }

    function fromBaseConversionToDecimal(string memory number, uint8 fromBase) internal pure returns (uint256) {
        bytes memory digits = bytes(number);
        uint256 decimalNumber = 0;
        uint256 base = 1;

        for (uint256 i = digits.length; i>0; i--){
            uint256 digit = uint8(digits[i-1]);
            if(digit >= 48 && digit <= 57) {
                digit -= 48;
            } else if(digit >= 65 && digit <= 70) {
                digit -= 55;

            }
            decimalNumber += digit * base;
            base *= fromBase; 
        }
        return decimalNumber;
    }
    
    function toBaseConversionToDecimal(uint256 decimalNumber, uint8 toBase) internal pure returns (string memory) {
        if (decimalNumber == 0) {
            return "0";
        }

       bytes memory result = new bytes(64);
       uint256 index = 0;
       while (decimalNumber > 0) {
           uint256 digit = decimalNumber % toBase;
           result[index++] = toHexChar(digit);
           decimalNumber /= toBase;
       }
       bytes memory baseconvert = new bytes(index);
       for (uint256 i = 0; i< index; i++){
           baseconvert[i] = result[index - 1 - i];
       }
       return string(baseconvert);


    }

   function toHexChar(uint256 digit) internal pure returns (bytes1) {
       if (digit < 10) {
           return bytes1 (uint8(digit) + 48);
       } else {
            return bytes1 (uint8(digit - 10 + 65));
       }
   }

}