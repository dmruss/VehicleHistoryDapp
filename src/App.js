import logo from './logo.svg';
import './App.css';
import { useState } from 'react';
import { ethers } from 'ethers';
import Vehicle from './artifacts/contracts/Vehicle.sol/Vehicle.json';

const vehicleAddress = '0x5FbDB2315678afecb367f032d93F642f64180aa3';

function App() {
  
  const [vehicle, setVehicleValue] = useState('');

  async function requestAccount() {
    var response = await window.ethereum.request({method: 'eth_requestAccounts'});
    console.log(response);
  }
  
  async function fetchHistory() {
    if (typeof window.ethereum !== 'undefined') {
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const contract = new ethers.Contract(vehicleAddress, Vehicle.abi, provider);
      try {
        const data = await contract.getHistory();
        console.log(data[0][0]);
        setVehicleValue(data[0][0]);

      } catch (err) {
        console.log('Error: ', err);
      }
    }
  }

  async function setGreeting() {
    if (!vehicle) return;
    if (typeof window.ethereum !== 'undefined') {
      
      // await requestAccount();
      // const provider = new ethers.providers.Web3Provider(window.ethereum);
      // const signer = provider.getSigner();
      // const contract = new ethers.Contract(greeterAddress, Greeter.abi, signer);
      // const transaction = await contract.setGreeting(greeting);
      // setGreetingValue('');
      // await transaction.wait();
      // fetchGreeting();
      
    }
  }


  return (
    
      <main role="main" class="container">

      <button type='button' className='btn btn-outline-primary' onClick={fetchHistory}>Fetch History</button>


      {vehicle}
      </main>

     

  );
    
  
}

export default App;
