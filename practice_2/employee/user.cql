create table if not exists user (
    login_user varchar primary key,
    description_user varchar,
    password_encrypted_user varchar,
    creation_date_user timestamp
);

insert into user (
    login_user, description_user,
    password_encrypted_user, creation_date_user
) values (
    'markus_persson', 'Markus Alexej Persson, also known as Notch,
        is a Swedish video game programmer and designer.',
    '12345', toTimestamp(now())
);

insert into user (
    login_user, description_user,
    password_encrypted_user, creation_date_user
) values (
    'alexey_pajitnov', 'Alexey Leonidovich Pajitnov is a Russian-American
        video game designer and computer engineer.',
    '54321', toTimestamp(now())
);

insert into user (
    login_user, description_user,
    password_encrypted_user, creation_date_user
) values (
    'ivan_ivanov', 'Ivan Kamenov Ivanov is a Bulgarian former professional
        footballer who played as a centre-back.',
    'ivsin', toTimestamp(now())
);

insert into user (
    login_user, description_user,
    password_encrypted_user, creation_date_user
) values (
    'admin', 'An Administrator provides office support to either an individual
        or team and is vital for the smooth-running of a business.',
    'admin', toTimestamp(now())
);
