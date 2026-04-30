// Placeholder source file so linguist counts JavaScript bytes for this fixture.
// Real projects have hundreds of these; this stub is enough to trigger ecosystem detection.
const greeting = 'hello from rdl-fixtures Node scenario';
function main() {
  console.log(greeting);
  return { greeting, scenario: __dirname };
}
module.exports = { main, greeting };
