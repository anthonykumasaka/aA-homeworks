// madLib
// Write a function that takes three strings - a verb, an adjective, and a 
// noun - uppercases and interpolates them into the sentence "We shall VERB the 
// ADJECTIVE NOUN".Use ES6 template literals.

// For example,

// > madLib('make', 'best', 'guac');
// "We shall MAKE the BEST GUAC."

// console.log("hello world");

function madLib(str1, str2, str3) {
    console.log(`We shall ${str1.toUpperCase()} the ${str2.toUpperCase()} ${str3.toUpperCase()}`);
    
    // `We shall ${str1.toUppserCase()} the ${str2.toUppserCase()} + ${str3.toUppserCase()}`;
}

// madLib("cat", "bat", "hat"); 
// madLib('make', 'best', 'guac');

function isSubstring(searchString, subString) {
    let searchArr = searchString.split(" ");
    for (let i = 0; i < searchArr.length; i += 1) {
        let subWod = searchArr[i]; 
        if (subWod === subString) {
            return true; 
        }
    }
    return false; 
    
}

// console.log(isSubstring("time to program", "time")); 
// console.log(isSubstring("Jump for joy", "joys")); 

function fizzBuzz(arr) {
  let results = [];
  for (let i = 0; i < arr.length; i += 1) {
    let num = arr[i]; 
    if (num % 3 === 0 && num % 5 === 0) {
      continue; 
    } else if (num % 3 === 0) {
      results.push(num);
    } else if (num % 5 === 0) {
      results.push(num); 
    }
  }
  return results; 
}

// console.log(fizzBuzz([3, 5, 7, 9, 10, 15])); 

function isPrime(num) {
  if (num < 2) {
    return false; 
  }

  for (let i = 2; i < num; i += 1) {
    if (num % i === 0) {
      return false 
    }
  }
  return true; 
}

// console.log(isPrime(2))
// console.log(isPrime(3))
// console.log(isPrime(5))
// console.log(isPrime(7))
// console.log(isPrime(9))
// console.log(isPrime(10))

function sumOfNPrimes(n) {
  if (n === 0) {
    return 0; 
  }
  let count = 0; 
  let results = 0;
  let i = 2; 
  while (results < n) {
    if (isPrime(i)) {
      results += 1; 
      count += i; 
    }
    
    i++; 
  }
  return count; 
}

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));