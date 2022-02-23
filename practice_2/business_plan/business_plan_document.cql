create table if not exists business_plan_document (
	id_version_plan_document int primary key,
	id_type_plan int,

	description_plan_document varchar,
	content_plan_document blob,
	creation_date_plan_document timestamp
);

insert into business_plan_document (
    id_version_plan_document, id_type_plan,
    description_plan_document, content_plan_document,
    creation_date_plan_document
) values (
    1, 1,
    'A business plan is a written document that describes in detail how a
        business—usually a startup—defines its objectives and how it is to go about
        achieving its goals. A business plan lays out a written roadmap for the firm
        from marketing, financial, and operational standpoints.',
    null, toTimestamp(now())
);

insert into business_plan_document (
    id_version_plan_document, id_type_plan,
    description_plan_document, content_plan_document,
    creation_date_plan_document
) values (
    2, 2,
    'Business plans are important documents used to attract investment before a
        company has established a proven track record. They are also a good way for
        companies to keep themselves on target going forward.',
    null, toTimestamp(now())
);

insert into business_plan_document (
    id_version_plan_document, id_type_plan,
    description_plan_document, content_plan_document,
    creation_date_plan_document
) values (
    3, 3,
    'Although they''re especially useful for new businesses, every company should
        have a business plan. Ideally, the plan is reviewed and updated periodically
        to see if goals have been met or have changed and evolved. Sometimes, a
        new business plan is created for an established business that has decided
        to move in a new direction.',
    null, toTimestamp(now())
);
