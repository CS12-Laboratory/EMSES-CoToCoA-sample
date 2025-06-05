all:
	chmod u+x setup-requester.sh
	./setup-requester.sh
	make -C coupler
	make -C requester requester
	make -C worker

clean:
	make -C coupler clean
	make -C requester clean
	make -C worker clean
