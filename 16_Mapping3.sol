pragma solidity >=0.5 <0.9;
contract testMapping{
    mapping (address => balance) public balanceAddress;
    struct balance {
        uint balanceTotal;
        uint balanceReceive;
        uint numpayment;
        mapping (uint=>Payment) payments;
    }
    struct Payment {
        uint mount;
        uint timestam;
    }   
    function receiveMoney () public payable {
        balanceAddress[msg.sender].balanceReceive += msg.value;
        balanceAddress[msg.sender].balanceTotal = address(this).balance;
        Payment memory payment = Payment (msg.value,now);
        balanceAddress[msg.sender].payments[balanceAddress[msg.sender].numpayment] = payment;
    }
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
    function whithdraw(address payable _to, uint _amount) public {
        require(balanceAddress[msg.sender].balanceTotal >= _amount,"not enough funds");
        _to.transfer(_amount);
        balanceAddress[msg.sender].balanceTotal = address(this).balance;
        balanceAddress[msg.sender].balanceReceive -= _amount;
    }
}