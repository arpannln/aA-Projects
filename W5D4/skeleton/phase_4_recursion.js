function nut(start, end){
  if (start === end) {
    return [end];
  }

  return nut(start, end-1).concat([end]);
}

function sumRec(arr) {
  if (arr.length === 1) {
    return arr[0];
  }
  return arr[0] + sumRec(arr.slice(1));
}

function exponent1(base, exp) {
  if (exp === 0) { return 1; }
  if (base === 0) { return 0; }
  return base * exponent1(base, exp - 1);
}

function exponent2(base, exp) {
  if (exp === 0) { return 1; }
  if (base === 0) { return 0; }
  if (exp % 2 === 0) {
    return exponent2(base, exp/2) * exponent2(base, exp/2);
  } else {
    return base * (exponent2(base,(exp - 1)/2) * exponent2(base,(exp - 1)/2));
  }
}

function fibonacci(n) {
  if (n === 1){ return [0];}
  if (n === 2){ return [0,1];}

  let previous = fibonacci(n-1);
  let nextEl = previous[previous.length-1] + previous[previous.length-2];
  return previous.concat([nextEl]);
}

function deepDup(arr) {
  if (arr.length === 1) { return [arr[0]]; }
  let result = [];
  for (let i = 0; i < arr.length; i++){
    if (Array.isArray(arr[i])) {
      result.push(deepDup(arr[i]));
    } else {
      result.push(arr[i]);
    }
  }
  return result;
}

function flatten(arr) {
  // if ((typeof arr[0] === "number") && (arr.length === 1)) {
  //   return arr[0];
  // }
  let result = [];
  for (let i = 0; i < arr.length; i++){
    if (Array.isArray(arr[i])) {
      result.concat(flatten(arr[i]));
    } else {
      result.concat([arr[i]]);
    }
  }
  return result;
}
