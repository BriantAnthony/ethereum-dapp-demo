pragma solidity ^0.5.0;

contract Adoption {
  //mapping (address => uint) public adopters;
  address[16] public adopters;

  // Adopting a pet
  function adopt (uint petId) public returns(uint) {
  	require(petId >= 0 && petId <= 15);

  	adopters[petId] = msg.sender;

  	return petId;
  }

  // Retrieve Adopters
  function getAdopters () public view returns(address[16] memory) {
  	return adopters;
  }
  
  
}