pragma solidity ^0.5.16;


import "openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";

contract ExampleTokenCrowdsale is Crowdsale, MintedCrowdsale, CappedCrowdsale{

	//minimum investor Contribution - 20000000000000000000
	//minimum investor Contribution - 50000000000000000000
	uint256 public investorMinCap =  70000000000000000000;
	uint256 public investorHardCap = 500000000000000000000;
	uint256 private tokensSold = 0;
	uint256 private tokensAvailable = 0;

	mapping(address => uint256) public contributions;

	constructor(uint256 _rate,
	  address payable _wallet,
	  ERC20 _token,
	  uint256 _cap)
	Crowdsale(_rate, _wallet, _token)
	CappedCrowdsale(_cap)
	public{
		tokensAvailable = _cap *_rate;
	}

	function getTokensLeft() view public returns (uint256){
		return (tokensAvailable-tokensSold) / 1000000000000000000;
	}

  function _preValidatePurchase(
    address _beneficiary,
    uint256 _weiAmount
  )
    internal view
  {
    super._preValidatePurchase(_beneficiary, _weiAmount);
    uint256 _existingContribution = contributions[_beneficiary];
    uint256 _newContribution = _existingContribution.add(_weiAmount);
    require(_newContribution >= investorMinCap && _newContribution <= investorHardCap,"Error:contribution amount must be between 5 and 50 ether");
	require( _existingContribution < 1,"Error: This account has already contributed");
	   
  }
  
}
