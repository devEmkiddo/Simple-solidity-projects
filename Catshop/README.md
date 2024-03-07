<h1>CATSHOP APP</h1>
<h3>Overview</h3>
<p>A shop for cats where users can purchase and own cats</p>
<ul>
  <li><code>Owner</code> deploys the contract and adds some cats to the shop. </li>
  <li>Users interact with the contract and buy cat using the <code>buy(uint256 _id)</code> function. </li>
  <li><code>mapping(address => uint256) private _catsOwned;</code> keeps track of cats owned by a user. </li>
  <li><code>mapping(uint256 => address) private _ownerOfCat;</code> keeps track owner of a specific cat</li>
  <li><code>transferOwnerShip(uint256 _id, address _to)</code> allows owners to transfer ownership of their cats. </li>
  <li><code>withdraw()</code> allows owner to withdraw the total ether gained from the sales. </li>
</ul>
