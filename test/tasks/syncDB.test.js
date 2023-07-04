const { syncDB } = require("../../tasks/syncdb");

describe("Debe de pasar la prueba", () => {
  test("debe de llamarse dos veces", () => {
    syncDB();
    let times = syncDB();

    expect(times).toBe(2);
  });
});
