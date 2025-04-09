# Bike Racing Championship 🏁🚴‍♂️

Bike Racing Championship is an on-chain bicycle racing game built on Solidity. Players compete in a race, managing their stamina and speed to cross the finish line first. The game features a fair competition system, random events affecting the race, and a transparent blockchain-based leaderboard.

## Features ✨
- 🚴 Multiplayer on-chain bicycle racing.
- ⏳ Stamina-based racing mechanics.
- 🎲 Randomized race events for dynamic gameplay.
- 🏆 Automatic winner detection and reset for new races.

## How It Works ⚙️
1. **Join the Race** – Players register with custom stamina and speed. 
2. **Start the Race** – The race begins when at least two players join.
3. **Progress the Race** – Players advance based on speed and random factors. 
4. **Win the Race** – The first player to reach the finish line wins! 

## Smart Contract Functions 📜
- `joinRace(uint _stamina, uint _speed)` – Enter the race with custom attributes.
- `startRace()` – Begins the race when enough players have joined.
- `progressRace()` – Advances the race, calculating distances and checking for a winner.
- `resetRace()` – Resets the race for a new round after a winner is declared.

## Deployment 🚀
This contract can be deployed on Ethereum or any EVM-compatible blockchain.

## License 📜
This project is open-source and available under the MIT License.

---
⚡ Ready to race? Get on-chain and start pedaling! 🚵‍♀️

