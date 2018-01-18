Array.prototype.bubbleSort = function() {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i+1]) {
        let temp = this[i];
        this[i] = this[i+1];
        this[i+1] = temp;
        sorted = false;
      }
    }
  }
  return this;
};

String.prototype.substrings = function() {
  let result = [];
  for (let i = 0; i < this.length; i++) {
    let substring = this[i];
    result.push(substring);
    for (let j = i + 1; j < this.length; j++) {
      substring += this[j];
      result.push(substring);
    }
  }
  return result;
};
