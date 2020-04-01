# BlockchainHomework3
Homework 3: Example token crowdsale with solidity

Author: Ben Carter

Thank you for going over this in class and extending the deadline. I juts could not figure it out for the life of me.

To change investor mininmum contribution to 7 ether i simply changed the value of the variable investorMinCap to the wei equivalent of 7 ether

To add function that allows you to see tokens left i added two variables (tokensSold and tokensAvailable) and also added a stement seeting tokensAvailable to _cap*_rate. The funtion itself then just returned tokensAvialable-TokensSold/1000000000000000.

When I attempt to buy tokens with 2.5 ether is returns an error becuase 2.5 is less than the minumum contribution of 7.

Purchasing tokens with 15 ether is succesfull

After purchasing 15 ether worth of tokens there are 99985 tokens left
