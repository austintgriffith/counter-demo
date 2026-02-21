# Counter Demo

A minimal counter dApp — a Solidity contract with a `count` and an `increment()` function, plus a frontend that shows the current count and a button to increment it.

Built with [Scaffold-ETH 2](https://scaffoldeth.io) and Foundry.

## How It Works

- **Counter.sol** — one `uint256 public count`, one `increment()` function, one `CounterIncremented` event
- **Frontend** — shows the count as a large number with an Increment button underneath
- No access control — anyone can increment

## Run Locally

```bash
yarn install
yarn chain          # Terminal 1: start local Anvil chain
yarn deploy         # Terminal 2: deploy Counter contract
yarn start          # Terminal 3: frontend at localhost:3000
```

## Tech Stack

- Scaffold-ETH 2
- Foundry (Solidity, Forge tests)
- Next.js
- wagmi / viem (via SE2 hooks)
