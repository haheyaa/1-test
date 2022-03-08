// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
interface IERC20{
    function TotalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function access()external returns(string memory name,string memory symbol);


    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract  ERC20 is IERC20{
    string public constant name="ali";
    string public constant symbol="az";
    uint public constant decimals=18;

    mapping (address=>uint) balances;
    mapping (address=>mapping(address=>uint)) allowed;

    uint public totalsupply;

    using safemath for uint;

    constructor(uint _totalsupply){
        totalsupply=_totalsupply;
        balances[msg.sender]=totalsupply;
    }
    function access()external override  pure returns(string memory ,string memory ){
        return(name,symbol);
    }
    function transfer(address receiver,uint numtokens)public override returns(bool){
        require (numtokens<=balances[msg.sender],"balance is not enough");
        balances[msg.sender]=balances[msg.sender]-numtokens;
        balances[receiver]=balances[receiver]+numtokens;
        emit Transfer(msg.sender,receiver,numtokens);
        return true;
    }
    function approve(address delegate,uint numtokens)public override returns(bool){
        allowed[msg.sender][delegate]=numtokens;
        return true;
    }
    function allowance(address owner, address spender) external override view returns (uint256){
        return(allowed[owner][spender]);
    }

    function transferFrom(address owner,address buyer,uint256 numtokens)public override returns (bool){
        require(balances[owner]>=numtokens,"balance is not enough");
        require(allowed[owner][msg.sender]>=numtokens,"the app is not allowed");
        balances[owner]=balances[owner].sub(numtokens);
        allowed[owner][msg.sender]=allowed[owner][msg.sender].sub(numtokens);
        balances[buyer]=balances[buyer].add(numtokens);

        return true;
    }
    function TotalSupply()public override view returns(uint){
        return totalsupply;
    }
    function balanceOf(address _address)public override view returns(uint){
        return balances[_address];
    }
}
library safemath{
        function sub(uint a,uint b)internal pure returns(uint){
            assert(b<=a);
            return a-b;
        }
        function add(uint a,uint b)internal pure returns(uint){
            uint c=a+b;
            assert(c>=a);
            return c;
   
    }

}
//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
//0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db

//aliz token address:0xa131AD247055FD2e2aA8b156A11bdEc81b9eAD95
//contract ceator:0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//total supply AZ= 4000