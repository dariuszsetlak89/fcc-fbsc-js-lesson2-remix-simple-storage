//pragma solidity ^0.8.7;  // ^ - nowsze wersje też są ok
//pragma solidity >=0.8.7 <0.9.0; // zakres wersji języka Solidity, dla których ten smart kontrakt zadziała

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// EVM, Ethereum Virtual Machine
// Avalanche, Fantom, polygon

contract SimpleStorage {
    // boolean, uint, int, address, bytes
    //bool hasFavoriteNumber = true;
    //uint256 favoriteNumber = 5;             // uint8, uint16, uint32, ..., uint256
    //string favoriteNumberInText = "Five";
    //int256 favoriteInt = -5;                // int8, int16, int32, ..., int256
    //address myAddress = 0xEb79FD91fc34F9A74c5A046eB0c88a20B9D8f778;
    //bytes32 favoriteBytes = "cat";          // bytes2, bytes3, ..., bytes32

    
    // This gets initialized to zero!
    // <- This means that this section is a comment
    uint256 favoriteNumber;                   // Default number = 0, Defaulf visibility - internal

    mapping(string => uint256) public nameToFavoriteNumber;
    
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // uint256[] public favoriteNumbersList;
    People[] public people;


    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view, pure
    function retrieve() public view returns (uint256) {
         return favoriteNumber;
    }

    // calldata, memory, storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        // People memory newPerson = People(_favoriteNumber, _name);
        // people.push(newPerson);
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

}
