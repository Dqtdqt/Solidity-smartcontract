pragma solidity ^0.5.13;
contract mappingStruct {
    mapping (address => Balance) public balanceReceive;
    struct Payment {
        uint amount;
        uint timestam;
    }
    struct Balance {
        uint totalBalance;
        uint numpayment;
        mapping (uint => Payment) payments;
    }
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
    function receiveMoney () public payable {
        balanceReceive[msg.sender].totalBalance += msg.value;
        Payment memory payment = Payment(msg.value,now);
        balanceReceive[msg.sender].payments[balanceReceive[msg.sender].numpayment]=payment;
        balanceReceive[msg.sender].numpayment ++;
    }
    function withdrawMoney (address payable _to, uint _amount) public {
        require(balanceReceive[msg.sender].totalBalance >= _amount,"not enough funds" );
        balanceReceive[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }
}