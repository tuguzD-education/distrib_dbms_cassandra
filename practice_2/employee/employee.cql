create table if not exists employee (
    id_employee int primary key,
    id_type_employee int,
    id_organization int,
    login_user varchar,

    age_employee int,
    name_employee varchar,
    surname_employee varchar,
    description_employee varchar,
    patronymic_employee varchar
);

insert into employee (
    id_employee, id_type_employee,
    id_organization, login_user, age_employee,
    name_employee, surname_employee,
    description_employee, patronymic_employee
) values (
    1, 1, 4, 'markus_persson', 28, 'Markus', 'Persson',
    'Markus Alexej Persson, also known as Notch, is a Swedish
        video game programmer and designer.', null
);

insert into employee (
    id_employee, id_type_employee,
    id_organization, login_user, age_employee,
    name_employee, surname_employee,
    description_employee, patronymic_employee
) values (
    2, 3, 3, 'alexey_pajitnov', 36, 'Alexey', 'Pajitnov',
    'Alexey Leonidovich Pajitnov is a Russian-American video
        game designer and computer engineer.', 'Leonidovich'
);

insert into employee (
    id_employee, id_type_employee,
    id_organization, login_user, age_employee,
    name_employee, surname_employee,
    description_employee, patronymic_employee
) values (
    3, 9, 2, 'ivan_ivanov', 14, 'Ivan', 'Ivanov',
    'Ivan Kamenov Ivanov is a Bulgarian former professional
        footballer who played as a centre-back.', 'Kamenov'
);

insert into employee (
    id_employee, id_type_employee,
    id_organization, login_user, age_employee,
    name_employee, surname_employee,
    description_employee, patronymic_employee
) values (
    4, 8, 1, 'admin', 25, 'admin', 'admin',
    'An Administrator provides office support to either an individual
        or team and is vital for the smooth-running of a business.', null
);
