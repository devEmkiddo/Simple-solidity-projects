// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract CatShop{
    address payable public owner;

    struct Cat{
       string Specie;
       string colour;
       uint256 price;
       uint256 age;
       address buyer;
       bool sold;
    }

    Cat[] public cats;

    mapping(address => uint256) private _catsOwned;
    mapping(uint256 => address) private _ownerOfCat;

    event Bought(
        address indexed buyer,
        uint256 price
    );

    event Withdrawal(
        address indexed to,
        uint256 amount
    );

    event TransferedOwnership(
        address indexed newOwner
    );

    constructor(){
        owner = payable(msg.sender);
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Not owmer");
        _;
    }

    function addCat(
        string memory _specie, 
        string memory _colour, 
        uint256 _price, 
        uint256 _age
        ) public onlyOwner{    
        cats.push(Cat(_specie, _colour, _price, _age, address(0), false));
    }

    function buy(uint256 _id) public payable{
        require(cats.length >= 0, "No Cats for sale");
        require(msg.value == cats[_id].price, "Send the correct price");
        require(cats[_id].buyer == address(0), "Already has an owner");
        require(cats[_id].sold == false, "Sold out");
        cats[_id].buyer = msg.sender;
        cats[_id].sold = true;
        _catsOwned[msg.sender] += 1;
        _ownerOfCat[_id] = msg.sender;
        emit Bought(msg.sender, cats[_id].price);
    }

    function catsOwned(address _owner) public view returns(uint256){
        return _catsOwned[_owner];
    }

    function ownerOfCat(uint256 _id) public view returns(address){
        return _ownerOfCat[_id];
    }

    function transferOwnerShip(uint256 _id, address _to) public{
        require(msg.sender == cats[_id].buyer, "Only owner of the cat can authorize this");
        require(_to != address(0), "New owner cannot be the dead address");
        cats[_id].buyer = _to;
        _ownerOfCat[_id] = _to;
        _catsOwned[msg.sender] -= 1;
        emit TransferedOwnership(_to);
    }

    function withdraw() public onlyOwner{
        require(address(this).balance > 0, "Insufficient Balance");
        owner.transfer(address(this).balance);
        Withdrawal(owner, address(this).balance);
    }
}