create table if not exists organization (
    id_organization int primary key,
    id_head_organization int,
    id_type_organization int,

    name_organization varchar,
    description_organization varchar,
    creation_date_organization timestamp
);

insert into organization (
    id_organization, id_head_organization,
    id_type_organization, name_organization,
    description_organization,
    creation_date_organization
) values (
    1, null, 2, 'Nintendo',
    'This company is credited with the conception of handheld video games in 1979.
        Nintendo was founded by Fusajiro Yamauchi in September 1889. It is
        headquartered in Kyoto, Japan but has subsidiaries and offices in several
        other parts of the world. Nintendo is the world’s largest video game company
        by revenue, with a net value of over USD85 Billion.', toTimestamp(now())
);

insert into organization (
    id_organization, id_head_organization,
    id_type_organization, name_organization,
    description_organization,
    creation_date_organization
) values (
    2, null, 2, 'Valve Corporation',
    'It’s headquartered in Bellevue, Washington and has a subsidiary in Luxembourg.
        It was started in 1996 by former Microsoft employees Gabe Newell and Mike
        Harrington. It has total equity of over USD2.5 Billion. Some of the work
        produced by Valve Corporation includes: Counter-strike series, Dota 2,
        Day of defeat series, Half-life series.', toTimestamp(now())
);

insert into organization (
    id_organization, id_head_organization,
    id_type_organization, name_organization,
    description_organization,
    creation_date_organization
) values (
    3, null, 2, 'Microsoft',
    'Microsoft Corporation is an American multinational technology corporation which
        produces computer software, consumer electronics, personal computers, and
        related services. Its best known software products are the Microsoft Windows
        line of operating systems, the Microsoft Office suite, and the Internet
        Explorer and Edge web browsers. Its flagship hardware products are the Xbox
        video game consoles and the Microsoft Surface lineup of touchscreen personal
        computers. Microsoft ranked No. 21 in the 2020 Fortune 500 rankings of the
        largest United States corporations by total revenue, and it was the world''s
        largest software maker by revenue as of 2016.', toTimestamp(now())
);

insert into organization (
    id_organization, id_head_organization,
    id_type_organization, name_organization,
    description_organization,
    creation_date_organization
) values (
    4, 3, 1, 'Mojang Studios',
    'Mojang Studios is a Swedish video game developer based in Stockholm. It was
        founded by the independent video game designer Markus Persson in 2009 as
        Mojang Specifications for the development and release of Persson''s sandbox
        and survival video game Minecraft. The studio inherited its name from a
        previous video game venture Persson had left two years prior. Following the
        game''s release, Persson, in conjunction with Jakob Porsér, incorporated
        the business as Mojang AB in late 2010 and hired Carl Manneh as the company''s
        chief executive officer. Other early hires included Daniel Kaplan and
        Jens Bergensten.', toTimestamp(now())
);
