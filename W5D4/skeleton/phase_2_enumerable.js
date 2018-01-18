Array.prototype.myEach = function(cb) {
  for (let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
};

Array.prototype.myMap = function(cb) {
  let result = [];
  for (let i = 0; i < this.length; i++) {
    result.push(cb(this[i]));
  }
  return result;
};

Array.prototype.myReduce = function(cb, initialVal) {
  let start = 0;
  if (!initialVal) {
    initialVal = this[0];
    start = 1;
  }
  let val = initialVal;
  for (let i = start; i < this.length; i++) {
     val = cb(val, this[i]);
  }
  return val;
};
