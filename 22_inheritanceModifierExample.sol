pragma solidity >=0.5 <0.9;
contract inheritanceModifier {
    mapping (address => uint256) public tokenBalance;
    address owner;
    uint tokenPrice = 1 ether;
    constructor () public {
        owner = msg.sender;
        tokenBalance[owner] = 100;
    }
    function createNewToken () public {
        require(msg.sender == owner,"you are not allowed");
        tokenBalance[owner] ++;
    }
    function purchargeToken () public payable {
        require(tokenBalance[owner] * tokenPrice >=0,"not enough funds");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }
    function burn () public {
        require(msg.sender == owner,"you are not allowed");
        tokenBalance[owner] --;
    }
    function sendToken (address payable _to, uint _amount) public {
        require(tokenBalance[msg.sender]>=_amount,"not enough token");
        assert (tokenBalance[_to]+ _amount >= tokenBalance[_to]);
        assert (tokenBalance[msg.sender]- _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount; 
        tokenBalance[_to]+= _amount;
    }
}