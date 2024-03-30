// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Transaction {
    address public owner;
    mapping (address => uint) public balances;
    event Sent(address from, address to, uint amount);

    constructor() public {
        owner = msg.sender;
    }

    function coin(address receiver, uint amount) public {
        require(msg.sender == owner, "Доступ запрещен!");
        require(amount < 1e60, "Слишком большая сумма!");
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Недостаточно средств!");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}