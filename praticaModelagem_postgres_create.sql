CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"email" TEXT NOT NULL,
	"senha" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TYPE "tamanho" AS ENUM ('P', 'M', 'G');
CREATE TYPE "categoria" AS ENUM ('Camisa', 'Calça', 'Vestido');

CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"preco" bigint NOT NULL,
	type "categoria"  TEXT NOT NULL,
	type "tamanho" char NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.pictures" (
	"id" serial NOT NULL,
	"nome_foto" TEXT NOT NULL,
	"product_id" bigint NOT NULL,
	"foto_principal" BOOLEAN NOT NULL DEFAULT 'false',
	CONSTRAINT "pictures_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"client_id" serial NOT NULL,
	"order_id" DATE NOT NULL,
	"product_id" bigint NOT NULL,
	"quantity" int NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orders" (
	"id" serial NOT NULL,
	"data_compra" TIMESTAMP NOT NULL,
	"endereco" TEXT NOT NULL,
	"status" TEXT NOT NULL,
	CONSTRAINT "orders_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "pictures" ADD CONSTRAINT "pictures_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");

ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("client_id") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("order_id") REFERENCES "orders"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("product_id") REFERENCES "products"("id");







