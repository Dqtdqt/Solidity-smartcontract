pragma solidity >=0.5 <0.9;
contract FunctionExample {
    mapping (address => uint) public balanceAdddress;
    
    address payable owner;
    constructor () public {
        owner = msg.sender;
    }

    function getowner () public view returns (address) {
        return owner;
    }
    
    function receiveMoney () public payable{
        assert (balanceAdddress[msg.sender] + msg.value >= balanceAdddress[msg.sender]);
        balanceAdddress[msg.sender] += msg.value;
    }
    function withdraw (address payable _to, uint _amount) public {
        require (balanceAdddress[msg.sender]>= _amount,"not enough funds");
        balanceAdddress[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    
    function () external payable {
        receiveMoney();
    }
    function getBalance () public view returns (uint){
        return address(this).balance;
    }
}