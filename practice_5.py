from threading import Thread
from time import sleep

from cassandra.concurrent import execute_concurrent_with_args
from cassandra.cluster import Cluster

import random
import typing as t
import pycountry
from faker import Faker

keyspace: t.Final[str] = 'learn_cassandra'.lower()
table_name: t.Final[str] = 'user_by_country'

person_gen: t.Final = Faker()
country_gen: t.Final[list] = list(pycountry.countries)

query_count: t.Final[int] = 100


class QueryManager(object):
    session = Cluster().connect(keyspace)

    min_age = 10
    max_age = 75

    prepared_insert = None
    prepared_select_all = None
    prepared_select_age = None
    prepared_select_country = None

    def __init__(self):
        self.__setup()

    @classmethod
    def __setup(cls):
        cls.prepared_truncate = cls.session.prepare(f"TRUNCATE {table_name}")

        cls.prepared_select_all = cls.session.prepare(f"SELECT * FROM {table_name}")
        cls.prepared_select_age = cls.session.prepare(f"SELECT * FROM {table_name} WHERE age=? ALLOW FILTERING")
        cls.prepared_select_country = cls.session.prepare(f"SELECT * FROM {table_name} WHERE country=?")

        cls.prepared_insert = cls.session.prepare(
            f"INSERT INTO {table_name} (country, user_email, first_name, last_name, age) VALUES (?, ?, ?, ?, ?)"
        )

    def truncate(self):
        self.session.execute(self.prepared_truncate)

    def select_all(self):
        return self.execute(
            None, self.prepared_select_all)[0]

    def select_country(self):
        return self.execute(
            [random.choice(country_gen).name], self.prepared_select_country)[0]

    def select_age(self):
        return self.execute(
            [person_gen.random_int(self.min_age, self.max_age)], self.prepared_select_age)[0]

    def insert_random(self):
        age = person_gen.random_int(self.min_age, self.max_age)
        first_name = person_gen.first_name()
        last_name = person_gen.last_name()

        person = {
            'country': random.choice(country_gen).name,
            'user_email': f"{first_name.lower()}_{last_name.lower()}_{age}@mail.com",
            'first_name': first_name, 'last_name': last_name, 'age': age
        }
        self.execute((person.values()), self.prepared_insert)

        return f"Row(country='{person['country']}', user_email='{person['user_email']}', " \
               f"age={person['age']}, first_name='{person['first_name']}', last_name='{person['last_name']}')"

    @classmethod
    def execute(cls, params, prepared):
        return [results[1] for results in
                execute_concurrent_with_args(cls.session, prepared, [params])]


def print_executed(result=None):
    if result:
        print(
            '\n'.join(list([str(x) for x in result]))
            if type(result) is not str else result
        )


def use_threads(thread_number: int, function):
    def multiple():
        [print_executed(function())
         for _ in range(query_count // thread_number)]

    threads = [
        Thread(target=multiple)
        for _ in range(thread_number)
    ]

    [thread.start() for thread in threads]
    [thread.join() for thread in threads]


def write_latency():
    def test_for(thread_number: int):
        manager.truncate()
        use_threads(thread_number=thread_number,
                    function=manager.insert_random)
        sleep(60)

    test_for(1)
    test_for(10)
    test_for(25)
    test_for(50)
    test_for(100)


def read_latency():
    def read_function():
        print_executed(manager.select_all())
        print_executed(manager.select_age())
        print_executed(manager.select_country())

    def test_for(thread_number: int):
        use_threads(thread_number=thread_number,
                    function=read_function)
        sleep(60)

    test_for(1)
    test_for(10)
    test_for(25)
    test_for(50)
    test_for(100)


if __name__ == '__main__':
    manager = QueryManager()

    # write_latency()
    # read_latency()
