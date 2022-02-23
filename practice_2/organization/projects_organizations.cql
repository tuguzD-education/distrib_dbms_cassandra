create table if not exists projects_organizations (
    id_project int,
    id_organization int,
    primary key (id_project, id_organization)
);

insert into projects_organizations
    (id_project, id_organization) values (2, 4);

insert into projects_organizations
    (id_project, id_organization) values (1, 1);

insert into projects_organizations
    (id_project, id_organization) values (3, 2);
