// Write a function titleize that takes an array of names and a function (callback).
// titleize should use Array.prototype.map to create a new array full of titleized 
// versions of each name - titleize meaning "Roger" should be made to read 
// "Mx. Roger Jingleheimer Schmidt".Then pass this new array of names to the callback, 
// which should use Array.prototype.forEach to print out each titleized name.
// function titleize(names, cb) {
//   let arr = names.map(name => `Mr. ${name.upperCase()} Jingleheimer Schmidt`); 
//   arr.forEach(element => { cb(element) 
    
//   });
// }

// function printCallback(name) {
//   console.log(name); 
// }

// function titleize(names, callback) {
//   let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
//   callback(titleized);
// }

// // invoking the function
// titleize(["Mary", "Brian", "Leo"], (names) => {
//   names.forEach(name => console.log(name));
// });

// console.log(titleize(["Mary", "Brian", "Leo"], printCallback))

function Elephant(name, height, tricks) {
  this.name = name; 
  this.height = height; 
  this.tricks = tricks; 
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'phrRRRRR!!!!!!'`);
};

Elephant.prototype.grow = function () {
  this.height += 12; 
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick); 
}; 

Elephant.prototype.play = function () {
  let ran = Math.random(this.tricks.length);
  console.log(this.tricks[ran]); 
};



