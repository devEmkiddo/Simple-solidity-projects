<h1>PIGGY BANK CONTRACT</h1>
<h3>Overview</h3>
<p>A simple savings contract where user can deposit and save ether and when the user is about to take out his/her ether the contracts gets detroyed just like a piggy bank</p>
<ul>
  <li>The user deploy the contract and call the <code>deposit()</code> function, which sends ether to the contract.</li>
  <li>When the user wants to take out his/her saved ether he/she then calls the <code>breakBank()</code> function.</li>
  <li>When the <code>breakBank()</code> function is called it calls the <code>selfdestruct()</code> which destroys the contract and send the contract balance which is the ether saved to the <code>owner</code></li>
</ul>

<h3>Aim</h3>
<p>To show how a real life piggyBank works in solidity</p>
