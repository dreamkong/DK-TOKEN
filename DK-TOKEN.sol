pragma solidity ^0.4.20;

contract ERC20Interface{
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    function balanceOf(address _owner) view returns (uint256 balance)
    function transfer(address _to, uint256 _value) returns (bool success)
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success)
    function approve(address _spender, uint256 _value) returns (bool success)
    function allowance(address _owner, address _spender) view returns (uint256 remaining)

    event Transfer(address indexed _from, address indexed _to, uint256 _value)
    event Approval(address indexed _owner, address indexed _spender, uint256 _value)
}

contract ERC20 is ERC20Interface{

    mapping(address => uint256) balanceOf;
    mapping(address => mapping(address => uint256)) internal allowed;

    construct() public{
        name = "DK Token";
        symbol = "DK";
        decimals = 1;
        totalSupply = 1000000000;
    }

    function balanceOf(address _owner) view returns (uint256 balance){
        return balanceOf[_ower];
    }

    function transfer(address _to, uint256 _value) returns (bool success){

        require(_to != address(0));
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value <= balanceOf[_to]);

        balanceOf[msg.sender] -= value;
        balanceOf[_to] += value;
        emit Transfer(msg.sender, _to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success){

        require(_to != address(0));
        require(balanceOf[_from] >= _value);
        require(allowed[_from][msg.sender] >= _value);
        require(balanceOf[_to] + _value <= balanceOf[_to]);

        balanceOf[_from] -= value;
        balanceOf[_to] += value;
        emit Transfer(_from, _to, _value);

        success = true;
    }

    function approve(address _spender, uint256 _value) returns (bool success){
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender,_spender,_value);

        success = true;
    }

    function allowance(address _owner, address _spender) view returns (uint256 remaining){
        return allowed[_owner][_spender]
    }
}