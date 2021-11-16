//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Vehicle {
    
    string private vin;
    string private make;
    string private model;
    uint64 private year;
    string private color;

    struct vehicleInfo {
        string vin;
        string make;
        string model;
        uint64 year;
        string color;
    }
    
    struct dateType {
            int year;
            int month;
            int day;
        }

    //struct for ledger item
    struct serviceEvent {
        string name;
        uint64 year;
        uint64 month;
        uint64 day;
        string description;

    }
    //array to hold structs of ledger items
    serviceEvent[] public serviceHistory;
    vehicleInfo public thisVehicleInfo;
    

    constructor(string memory _vin, string memory _make, string memory _model, uint64 _year) {
        //console.log("Vehicle history created for", _year, " ", _make, " ", _model);
        vin = _vin;
        make = _make;
        model = _model;
        year = _year;
        color = '';
        thisVehicleInfo.vin = _vin;
        thisVehicleInfo.make = _make;
        thisVehicleInfo.model = _model;
        thisVehicleInfo.year = _year;
        thisVehicleInfo.color = '';

        serviceEvent memory anEvent;
        anEvent.name = "Vehicle History ledger created";
        anEvent.year = 2021;
        anEvent.month = 11;
        anEvent.day = 15;
        anEvent.description = 'Created new ledger';
        serviceHistory.push(anEvent);
    }

    //set color function
    function setColor(string calldata _color) public {
        color = _color;
        console.log("Vehicle color set as", color);
        serviceEvent memory anEvent;
        anEvent.name = 'Color changed';
        anEvent.year = 2021;
        anEvent.month = 11;
        anEvent.day = 15;
        anEvent.description = 'same as name';
        serviceHistory.push(anEvent);
        console.log("New service event added");
    }

    //create new ledger item
    function newServiceEvent(string memory _name, uint64 _year, uint64 _month, uint64 _day, string memory _description) public {
        serviceEvent memory anEvent;
        anEvent.name = _name;
        anEvent.year = _year;
        anEvent.month = _month;
        anEvent.day = _day;
        anEvent.description = _description;
        serviceHistory.push(anEvent);
        console.log("New service event added");
    }

    //get history
    function getHistory() public view returns (serviceEvent[] memory) {
        return serviceHistory;
    }

    //get vehicle info
    function getVehicleInfo() public view returns (string[] memory) {
        
        string[] memory info;
        info[0] = vin;
        info[1] = make;
        return info;
    }
    
}