const cron = require("node-cron");
const { syncDB } = require("./tasks/syncdb");

cron.schedule("* * * * *", syncDB);
