// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Token {
    string public name;
    string public symbol;
    uint8 public decimal;
    uint8 public totalSupply;
    mapping(address => uint256) balance;

    event Transfer(address from, address to, uint256 amount);

    function balanceOf(address owner) public view returns (uint256) {
        uint256 balanceOfUser = balance[owner];
        return balanceOfUser;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(balance[msg.sender] >= 0, "FALTA GRANA");

        balance[_to] += _value;
        balance[msg.sender] -= _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }
}
