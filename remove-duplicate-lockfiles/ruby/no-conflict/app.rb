# Placeholder Ruby source so linguist counts Ruby bytes for this fixture.

GREETING = "hello from rdl-fixtures Ruby scenario"

def main
  puts GREETING
  { greeting: GREETING }
end

main if __FILE__ == $PROGRAM_NAME
