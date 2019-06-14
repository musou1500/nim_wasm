Module['onRuntimeInitialized'] = function() {
  const nimFact = Module.cwrap('fact', 'number', ['number', 'number']);
  const factRec = (n, acc) => n <= 1 ? acc : factRec(n - 1, n * acc);
  const factLoop = (n, acc) => {
    while (n > 1) {
      acc = n * acc;
      n = n - 1;
    }

    return acc;
  };

  const suite = new Benchmark.Suite;
  suite.add('nimFact', () => nimFact(100))
    .add('factRec', () => factRec(100))
    .add('factLoop', () => factLoop(100))
    .on('cycle', event => {
      console.log(String(event.target));
    })
    .on('complete', () => {
      console.log('Fastest is ' + suite.filter('fastest').map('name'));
    })
    .run({ 'async': true });
};
