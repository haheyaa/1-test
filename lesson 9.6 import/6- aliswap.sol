// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./4-erc20new.sol";
contract aliswap {
    
    //ali              :0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 tokenA
    //mohammad         :0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db  tokenB
    address exchange=0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
    address public liqpoolAB;//=0x617F2E2fD72FD9D5503197092aC168c91465E7f2;

        uint liqcoeficient=1;
        address public user;
        address tokenA;
        address tokenB;
        uint numtokensB;

        function transfer(address _tokenA,uint numtokens)public  returns(uint){
            IERC20(_tokenA).approve(msg.sender,numtokens);
           return IERC20(_tokenA).allowance(address(this),msg.sender);
          //  IERC20(_tokenA).transferFrom(msg.sender,address(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db),10);

        }
        
        function access1(address _token)public  returns(uint,string memory,string memory){
            uint a=IERC20(_token).TotalSupply();
            (string memory name,string memory symbol)=IERC20(_token).access();
            return(a,name,symbol);
    }
/*/
    function approveuser(address _tokenA,uint _numtokensA)public{
        tokenA=_tokenA;
        IERC20(tokenA).approve(exchange, _numtokensA);//lets exchange do swap instead of user
        user=msg.sender;
    }
    function approveliqpool(address _tokenB,uint _numtokensB)public{
        tokenB=_tokenB;
        IERC20(tokenB).approve(exchange, _numtokensB);//lets exchange do swap instead of user
        liqpoolAB=msg.sender;
    }
    function transferFromexchange(uint _numtokensA)public{
        IERC20(tokenA).transferFrom(user, liqpoolAB, _numtokensA);//owner should have tkenA,//delegate to exchange should have been done by owner to delegate//tokena from ali to liqpool
        numtokensB=_numtokensA*liqcoeficient;
        IERC20(tokenB).transferFrom(liqpoolAB,user, numtokensB);//tokenb from liqpool to ali

    }
/*/
}
