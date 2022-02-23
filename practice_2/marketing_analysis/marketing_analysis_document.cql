create table if not exists marketing_analysis_document (
    id_version_analysis_document int primary key,
    id_type_analysis int,

    description_analysis_document varchar,
    content_analysis_document blob,
    creation_date_analysis_document timestamp
);

insert into marketing_analysis_document (
    id_version_analysis_document, id_type_analysis,
    description_analysis_document,
    content_analysis_document,
    creation_date_analysis_document
) values (
    1, 8,
    'A market analysis is a quantitative and qualitative assessment of a market.
        It looks into the size of the market both in volume and in value, the
        various customer segments and buying patterns, the competition, and the
        economic environment in terms of barriers to entry and regulation.',
    null, toTimestamp(now())
);

insert into marketing_analysis_document (
    id_version_analysis_document, id_type_analysis,
    description_analysis_document,
    content_analysis_document,
    creation_date_analysis_document
) values (
    2, 2,
    'When assessing the size of the market, your approach will depend on the type
        of business you are selling to investors. If your business plan is for a small
        shop or a restaurant then you need to take a local approach and try to assess
        the market around your shop. If you are writing a business plan for a
        restaurant chain then you need to assess the market a national level.
        Depending on your market you might also want to slice it into different
        segments. This is especially relevant if you or your competitors focus only
        on certain segments.',
    null, toTimestamp(now())
);

insert into marketing_analysis_document (
    id_version_analysis_document, id_type_analysis,
    description_analysis_document,
    content_analysis_document,
    creation_date_analysis_document
) values (
    3, 5,
    'A marketing analysis is a study of the dynamism of the market. It is the
        attractiveness of a special market in a specific industry. Marketing
        analysis is basically a business plan that presents information regarding
        the market in which you are operating in. It deals with various factors and
        should not be confused with market analysis.',
    null, toTimestamp(now())
);
