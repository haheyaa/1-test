// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./4-erc20new.sol";
contract testuniswap {
    address private constant UNISWAP_V2_ROUTER=0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address private constant WETH=0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function swap(address _tokenIn,address tokenOut,uint _amountIn,uint _amountOutMin,address _to)external{
        IERC20(_tokenIn).transferfrom(msg.sender,address(this),_amountIn);
        IERC20(_tokenIn).approve(UNISWAP_V2_ROUTER,amountIn);
        }
}
//.Mysolidity/lesson 9.5/