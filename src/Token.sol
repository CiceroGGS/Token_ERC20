// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Token {
    string public name;
    string public symbol;
    uint8 public decimal;
    uint8 public totalSupply;

    mapping(address => uint256) balance;
    mapping(address => mapping(address => uint256)) allowance;

    event Transfer(address from, address to, uint256 amount);
    event Approval(address _owner, address _spender, uint256 amount);

    function balanceOf(address owner) public view returns (uint256) {
        uint256 balanceOfUser = balance[owner];
        return balanceOfUser;
    }

    function transfer(address _to, uint256 _value) public {
        require(balance[msg.sender] >= 0, "INSUFFICIENT_AMOUNT");

        balance[_to] += _value;
        balance[msg.sender] -= _value;

        emit Transfer(msg.sender, _to, _value);
    }

    function approve(address _spender, uint256 _value) public {
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public {
        require(
            allowance[_from][msg.sender] >= _value,
            "INSUFFICIENT_ALLOWNCE"
        );
    }
}
