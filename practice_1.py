import typing as t
import time

keyspace: t.Final[str] = 'TestKeyspace'.lower()
table_name: t.Final[str] = 'users'


def print_header(header: str):
    print(f"{header}:\n")


def table_content(*attr: str, given_result=None):
    result = given_result if given_result \
        else session.execute(f"select * from {table_name}")
    result_list = list([
        str(x) if not attr else ' '.join([str(getattr(x, y)) for y in attr])
        for x in result
    ])

    print([] if not result_list else
          (' ' if attr else '\n').join(result_list))
    print()


def db_query_execution():
    time.sleep(5)
    print_header("Выполнение простых запросов к БД")

    table_content()

    session.execute(f"INSERT INTO {table_name} (id, name, login, group) "
                    "VALUES (1, 'User', 'setevoy', 'wheel')")
    table_content()

    time.sleep(5)

    table_content('login', 'name')
    table_content('id')

    name, login, group = 'newuser', 'newlogin', 'newgroup'
    session.execute("INSERT INTO users (id, name, login, group) "
                    "VALUES (2, %s, %s, %s)", (name, login, group))
    table_content()

    time.sleep(5)

    my_dict = {'name': 'secondname', 'login': 'secondlogin', 'group': 'secondgroup', }
    session.execute("INSERT INTO users (id, name, login, group) "
                    "VALUES (2, %(name)s, %(login)s, %(group)s)", my_dict)
    table_content()


def request_asynchronous():
    time.sleep(5)
    print_header("Выполнение асинхронных запросов к БД")

    from cassandra import ReadTimeout

    future = session.execute_async(f"select * from {table_name}")
    try:
        rows = future.result()
        [print(user.name, user.group) for user in rows]
    except ReadTimeout:
        print('ERROR: query timed out')
    print()

    def handle_success(rows):
        try:
            [print(user.name, user.group) for user in rows]
        except Exception as e:
            print('ERROR: %s' % e)

    def handle_error(exception):
        print('Failed to fetch user info: %s' % exception)

    future.add_callbacks(handle_success, handle_error)
    print()


def consistency_level_change():
    time.sleep(5)
    print_header("Изменение уровня согласованности")

    from cassandra import ConsistencyLevel
    from cassandra.query import SimpleStatement

    query = SimpleStatement(
        "INSERT INTO users (id, name, login, group) VALUES (%s, %s, %s, %s)",
        consistency_level=ConsistencyLevel.QUORUM)
    session.execute(query, (3, 'name3', 'login3', 'group3'))
    table_content()


def prepared_statements():
    time.sleep(5)
    print_header("Выполнение подготовленного запроса к БД")

    statement = session.prepare(f"SELECT * FROM {table_name} WHERE id=?")

    [table_content(given_result=session.execute(statement, [user_id]))
        for user_id in range(1, 4)]


if __name__ == '__main__':
    from cassandra.cluster import Cluster
    cluster = Cluster()

    session = cluster.connect(keyspace)
    session.execute(f"TRUNCATE {table_name}")

    db_query_execution()
    request_asynchronous()
    consistency_level_change()
    prepared_statements()
