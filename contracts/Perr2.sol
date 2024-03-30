// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Perr2 {
  function BinaryToDecimalTwo(uint BinaryNumberTwo) public pure returns(uint){
    uint decimalNumber = 0;
    uint base =1;
    uint temp = BinaryNumberTwo;

    while (temp>0)
    {
      uint lastDigit = temp % 2;
      temp = temp /2;
      decimalNumber += lastDigit * base;
      base = base * 10;
    }
    return decimalNumber;
    

  }
}
