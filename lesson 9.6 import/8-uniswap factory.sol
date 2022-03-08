// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract Uniswapv2factory is Iuniswapv2factory{
    address public feeTo;
    address public feetosetter;

    mapping (address =>mapping(address=>address)) public getpair;
    address[] public allpairs;
    event ricecreated(address indexed token0,address indexed token1,address pair,uint);

    constructor(address _feetosetter) public{
        feetosetter=_feetosetter;
    }

    function allpairslength()external view returns(address pair){
        return allpairs.length;
    }
    function creatpair(address tokenA,address tokenB) external returns(address pair){
        require (tokenA!=tokenB,'uniswapv2:Identical_addresses');
        (address token0,address token1)=tokenA<tokenB ? (tokenA,tokenB):(tokenB,tokenA);
        require (token0 !=address(0),'uniswapv2: ZERO_ADDRESS');
        require (getpair[token0][token1]==address(0));
        bytes memory bytecode =type(uniswapv2pair).creationcode;
        bytes32 salt=keccak256(abi.encodepacked(token0,token1));
        assembly {
            pair:=create2(0,add(bytecode,32),mload(bytecode,32),mload(bytecode),salt)
        }
    }
}
    