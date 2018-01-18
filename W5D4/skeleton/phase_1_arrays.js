Array.prototype.uniq = function() {
  let result = [];
  for (let i = 0; i < this.length; i++) {
    if (!result.includes(this[i])) {
      result.push(this[i]);
    }
  }
  return result;
};

Array.prototype.twoSum = function() {
  let result = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        result.push([i, j]);
      }
    }
  }
  return result;
};

Array.prototype.transpose = function() {
  let result = Array.from({length: this[0].length}, ()=>Array.from({length: this.length}));

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      result[j][i] = this[i][j];
    }
  }
  return result;
};
