pragma solidity ^0.8.0;

contract BikeRacingChampionship {
    struct Racer {
        address racerAddress;
        uint stamina;
        uint speed;
        uint totalDistance;
    }
    
    Racer[] public racers;
    mapping(address => bool) public isRacing;
    uint public raceDistance = 100;
    bool public raceOngoing;
    address public winner;
    
    event RaceStarted();
    event RaceFinished(address winner);
    event RacerProgress(address racer, uint distance);
    
    function joinRace(uint _stamina, uint _speed) external {
        require(!isRacing[msg.sender], "Already racing");
        require(!raceOngoing, "Race in progress");
        
        racers.push(Racer(msg.sender, _stamina, _speed, 0));
        isRacing[msg.sender] = true;
    }
    
    function startRace() external {
        require(!raceOngoing, "Race already started");
        require(racers.length > 1, "Not enough racers");
        
        raceOngoing = true;
        emit RaceStarted();
    }
    
    function progressRace() external {
        require(raceOngoing, "No race in progress");
        
        for (uint i = 0; i < racers.length; i++) {
            if (racers[i].stamina > 0) {
                uint progress = racers[i].speed + (block.timestamp % 5); // Randomized progress
                racers[i].totalDistance += progress;
                racers[i].stamina -= 1;
                emit RacerProgress(racers[i].racerAddress, racers[i].totalDistance);
                
                if (racers[i].totalDistance >= raceDistance) {
                    raceOngoing = false;
                    winner = racers[i].racerAddress;
                    emit RaceFinished(winner);
                    resetRace();
                    break;
                }
            }
        }
    }
    
    function resetRace() internal {
        delete racers;
        raceOngoing = false;
        winner = address(0);
    }
}
