<h1>BANKING CONTRACT</h1>
<h3>Overview</h3>
<p>This contract acts like a bank and allow users deposit, transfer, check balance and withdraw funds</p>
<ul>
  <li>There is a mapping in the contract that keeps track of the balances of every single person that interacts with the contract <code> mapping(address => uint256) private _balance;</code>
  <li>Users deposit funds using the <code>deposit()</code> function.</li>
  <li>Users can transfer funds using the <code>transfer()</code> function, the function checks if the user has sufficient balance to make that transaction, using the require statement <code>require(balance(msg.sender) >= amount, "Insufficient Balance");</code></li>
  <li>Users can withdraw their money from the contract using the <code>withdraw()</code> function</li>
  <li>Users can check their balances by calling the <code>balance()</code> function</li>
</ul>

<h3>Aim</h3>
<p>This shows that blockchain can be a better alternative to banks</p>
