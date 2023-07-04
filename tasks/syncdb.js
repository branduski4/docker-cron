let times = 0;

const syncDB = () => {
  times++;
  console.log("llamada synccdb");

  return times;
};

module.exports = {
  syncDB,
};
