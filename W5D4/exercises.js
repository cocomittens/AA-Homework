function madLib(verb, adjective, noun) {
    return `We shall ${verb}.toUpperCase() the ${adjective}.toUpperCase() ${noun}.toUpperCase()`
}

function isSubstring(searchString, subString) {
    return searchString.indexOf(subString) !== -1
}

function fizzBuzz(array) {
    let result = [];
    for (let i = 0; i < array.length; i++) {
        div_3 = i % 3 == 0
        div_5 = i % 5 == 0
        if ((div_3 && !div_5) || (!div_3 && div_5)) {
            result.push(i);
        }
    }
    return result;
}

function isPrime(number) {
    for (let i = 0; i < number; i++) {
        // if number % i === 0 {
        //     return false;
        // }
    }
    return true;
}

function sumOfNPrimes(n) {

}

function titleize(names, callback) {

}