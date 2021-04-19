install: build release deploy test

build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

logs:
	docker-compose logs -f

test:
	@curl -s http://localhost:30000/source/wibble_a; echo 
	@curl -s http://localhost:30000/source/wibble_b; echo
	@curl -s http://localhost:30000/source/wibble_c; echo
	@curl -s http://localhost:30000/source/wibble_d; echo;
	@curl -s http://localhost:30000/source/wibble_e; echo;
	@curl -s http://localhost:30000/source/wibble_f; echo;
	@curl -s http://localhost:30000/source/wibble_g; echo;
	@curl -s http://localhost:30000/source/wibble_h; echo;
	@curl -s http://localhost:30000/source/wibble_i; echo;
	@curl -s http://localhost:30000/source/wibble_j; echo;
	@curl -s http://localhost:30000/source/wibble_k; echo;
	@curl -s http://localhost:30000/source/wibble_l; echo;
	@curl -s http://localhost:30000/source/wibble_m; echo;
	@curl -s http://localhost:30000/source/wibble_n; echo;
	@curl -s http://localhost:30000/source/wibble_o; echo;
	@curl -s http://localhost:30000/source/wibble_p; echo;
	@curl -s http://localhost:30000/source/wibble_q; echo;
	@curl -s http://localhost:30000/source/wibble_r; echo;
	@curl -s http://localhost:30000/source/wibble_s; echo;
	@curl -s http://localhost:30000/source/wibble_t; echo;
	@curl -s http://localhost:30000/source/wibble_u; echo;
	@curl -s http://localhost:30000/source/wibble_v; echo;
	@curl -s http://localhost:30000/source/wibble_w; echo;
	@curl -s http://localhost:30000/source/wibble_x; echo;
	@curl -s http://localhost:30000/source/wibble_y; echo;
	@curl -s http://localhost:30000/source/wibble_z; echo;
	@curl -s http://localhost:30000/source/wibble_0; echo;
	@curl -s http://localhost:30000/source/wibble_1; echo;
	@curl -s http://localhost:30000/source/wibble_2; echo;
	@curl -s http://localhost:30000/source/wibble_3; echo;
	@curl -s http://localhost:30000/source/wibble_4; echo;
	@curl -s http://localhost:30000/source/wibble_5; echo;
	@curl -s http://localhost:30000/source/wibble_6; echo;
	@curl -s http://localhost:30000/source/wibble_7; echo;
	@curl -s http://localhost:30000/source/wibble_8; echo;
	@curl -s http://localhost:30000/source/wibble_9; echo;
	@curl -s -X POST http://localhost:30000/source/wibble; echo;

clean:
	docker rm -f $$(docker ps -qa)

release:
	make -C source build push
	make -C sink build push

deploy:
	make -C source k8s
	make -C sink k8s

