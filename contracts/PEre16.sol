// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract PEre16 {
  function BinaryToDecimal(uint BinaryNumber) public pure returns(uint){
    uint decimalNumber = 0;
    uint base =1;
    uint temp = BinaryNumber;

    while (temp>0)
    {
      uint lastDigit = temp % 10;
      temp = temp /10;
      decimalNumber += lastDigit * base;
      base = base * 2;
    }
    return decimalNumber;
    

  }
}
