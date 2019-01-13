.PHONY := default init clean build run install

NAME:=com.github.pckilgore.eosbasics
OUTPUT_FOLDER:=dist

default:
	@ mmake help

init: dist_setup
	@ echo "Initialized"

dist_setup:
	@ test -e dist || mkdir dist

# Removes build artifacts
clean:
	@ rm -rf ${OUTPUT_FOLDER}/*

# Build the appplication
build: setup clean
	@ echo "🏗  Starting Build on $$(date '+%A %W %Y %X')" | tee -a build.log  
	@ meson ${OUTPUT_FOLDER} --prefix=/usr >> build.log
	@ ninja -C ${OUTPUT_FOLDER} >> build.log
	@ echo "🏗  Build exited on $$(date '+%A %W %Y %X')" | tee -a build.log  

run: 
	@ ./dist/${NAME}

install:
	@ test -e ./dist/${NAME} || echo "No build found to install."; exit 1
	@ sudo ninja -C ${OUTPUT_FOLDER} install

%:
	@ true 
