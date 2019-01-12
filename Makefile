.PHONY := default init test clean build pkg

default:
	@ mmake help

# Build the appplication
build:
	@ valac --pkg gtk+-3.0 -v -o dist/HelloWorld src/application.vala

run: 
	@ ./dist/HelloWorld

%:
	@ true
