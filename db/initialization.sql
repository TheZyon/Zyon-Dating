CREATE DATABASE zyon_dating;


create table public.be_service_province
(
    id    bigserial
        primary key,
    nome  varchar(255),
    sigla varchar(255)
);

alter table public.be_service_province
    owner to postgres;

create table public.be_service_comuni
(
    id           bigserial
        primary key,
    nome         varchar(255),
    provincia_id bigint
        constraint fk48x47g97ieggvojvl8xk0xxyr
            references public.be_service_province
);

alter table public.be_service_comuni
    owner to postgres;

create table public.roles
(
    id        bigserial
        primary key,
    role_name varchar(255)
);

alter table public.roles
    owner to postgres;

create table public.users
(
    id       bigserial
        primary key,
    email    varchar(255) not null
        constraint uk_6dotkott2kjsp8vw4d0m25fb7
            unique,
    name     varchar(255),
    password varchar(255) not null,
    username varchar(255) not null
        constraint uk_r43af9ap4edm43mmtq01oddj6
            unique
);

alter table public.users
    owner to postgres;

create table public.chat
(
    id       bigserial
        primary key,
    message  varchar(255),
    time     timestamp(6),
    id_user1 bigint
        constraint fkgi3ktliao64kwlkmuma08jfvi
            references public.users,
    id_user2 bigint
        constraint fk8i1yqfccjriv55lnqx59yc0dm
            references public.users
);

alter table public.chat
    owner to postgres;

create table public.likes
(
    id       bigserial
        primary key,
    time     timestamp(6),
    id_user1 bigint
        constraint fk54wxqf45f72mdodh044o1c1c8
            references public.users,
    id_user2 bigint
        constraint fknrs8qd66v7xmhnhvqusmwn5kh
            references public.users
);

alter table public.likes
    owner to postgres;

create table public.notifiche
(
    id         bigserial
        primary key,
    date       timestamp(6),
    payload    varchar(255),
    visualized boolean,
    id_utente  bigint
        constraint fkrl37c0sgfh39icioyiqfture0
            references public.users
);

alter table public.notifiche
    owner to postgres;

create table public.profile_pics
(
    id        bigserial
        primary key,
    public_id varchar(255),
    user_id   bigint
        constraint fk3vehyrom25gkxyadoerdwpxxb
            references public.users
);

alter table public.profile_pics
    owner to postgres;

create table public.user_details
(
    id          bigserial
        primary key,
    breed       varchar(255),
    description varchar(255),
    dog_age     integer not null,
    dog_name    varchar(255),
    dog_sex     varchar(255),
    dog_weight  integer not null,
    name        varchar(255),
    user_comune bigint
        constraint fkn5m3f4drmt7sm9cqslojy3ou4
            references public.be_service_comuni,
    user_id     bigint
        constraint fkicouhgavvmiiohc28mgk0kuj5
            references public.users
);

alter table public.user_details
    owner to postgres;

create table public.users_roles
(
    user_id bigint not null
        constraint fk2o0jvgh89lemvvo17cbqvdxaa
            references public.users,
    role_id bigint not null
        constraint fkj6m8fwv7oqv74fcehir1a9ffy
            references public.roles,
    primary key (user_id, role_id)
);

alter table public.users_roles
    owner to postgres;

INSERT INTO public.roles (id, role_name)
VALUES (1, 'ROLE_ADMIN'),(2, 'ROLE_USER'), (3, 'ROLE_MODERATOR');
