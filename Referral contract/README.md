<h1>REFFERAL CONTRACT</h1>
<h3>Overview</h3>
<p>This is a simple referal system contract that allows users to refer other people and distribute rewards for refering</p>
<ul>
  <li>User refer other people using the <code>refer()</code> which takes in an <code>address</code> an the input parameter.</li>
  <li>Theres a mapping which registers the address a user refers <code>mapping(address => address) public referralOf;</code>.</li>
  <li>Theres also a mapping which keeps track of a users referral count <code>mapping(address => uint256) public referralCount;</code></li>
  <li>And lastly theres also an <code>internal claim()</code> function that is trigerred when ever a user refers 2 or more users, this function distributes rewards to the user. </li>
</ul>
